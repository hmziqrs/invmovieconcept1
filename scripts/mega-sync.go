package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"runtime"
	"strings"
	"time"
)

func main() {
	argsLen := len(os.Args)

	if argsLen < 4 {
		fmt.Println("Pass source, destination & action")
		return
	}
	source := strings.TrimSpace(os.Args[1])
	destination := strings.TrimSpace(os.Args[2])
	action := strings.TrimSpace(os.Args[3])

	if action == "change" {
		start := time.Now()
		changes := getGitChanges("")
		var toSave string
		parsedSource := slash(source)
		for _, file := range changes {
			if strings.Contains(parsedSource, file) {
				toSave = file
			}
		}
		gitSyncChange([]string{toSave}, "./", destination)
		fmt.Println(time.Since(start))
		return
	}
	if action == "init" {
		start := time.Now()
		files, err := ioutil.ReadDir(source)
		if err != nil {
			log.Fatal(err)
		}
		syncList(files, source, destination, nil)
		fmt.Println(time.Since(start))
		return
	}
	if action == "git" {
		start := time.Now()

		strpaths := getGitChanges(source)

		gitSyncChange(strpaths, source, destination)
		fmt.Println(time.Since(start))
	}
}

func getGitChanges(source string) []string {
	var argstr []string
	if runtime.GOOS == "windows" {
		if source == "" {

			argstr = []string{"/C", "git", "status", "-s"}
		} else {
			argstr = []string{"/C", "cd", source, "&&", "git", "status", "-s"}

		}
	}
	list := exec.Command("cmd", argstr...)
	stdout, _ := list.Output()
	rawFiles := strings.Split(string(stdout), "\n")
	var strpaths []string
	for _, rawFile := range rawFiles {
		parsed := strings.Split(strings.TrimSpace(rawFile), " ")
		parsedSize := len(parsed)
		actions := parsed[0]
		if parsedSize == 1 || actions == "D" {
			continue
		}
		strpaths = append(strpaths, slash(parsed[parsedSize-1]))
	}

	return strpaths
}

func gitSyncChange(strpaths []string, source string, destination string) {
	for _, path := range strpaths {
		sourcePath, _ := filepath.Abs(filepath.Join(source, path))
		destinationPath, _ := filepath.Abs(filepath.Join(destination, path))
		file, err := ioutil.ReadFile(sourcePath)
		if err != nil {
			dirpath := slash(sourcePath + "/")
			dirContent, direrr := ioutil.ReadDir(dirpath)
			if direrr != nil {
				log.Fatal(direrr.Error())
				continue
			}
			newDirPath := slash(destinationPath + "/")
			os.Mkdir(newDirPath, os.ModeDir)

			var dirFiles []string
			for _, dirFile := range dirContent {
				dirFiles = append(dirFiles, dirFile.Name())
			}
			dirSource := slash(source + "/" + path)
			dirDestination := slash(destination + "/" + path)
			gitSyncChange(dirFiles, dirSource, dirDestination)
			continue

		}
		ioutil.WriteFile(destinationPath, file, 0777)
	}
}

func syncList(files []os.FileInfo, source string, destination string, baseIgnores []string) {
	var ignores []string
	if baseIgnores != nil {
		ignores = append([]string{}, baseIgnores...)
	}
	gitIgnoreBytes, _ := ioutil.ReadFile(filepath.Join(source, ".gitignore"))
	if gitIgnoreBytes != nil {
		gitIgnoreRaw := strings.Split(string(gitIgnoreBytes), "\n")
		for _, str := range gitIgnoreRaw {
			trim := strings.TrimSpace(str)
			if trim != "" && !strings.Contains(trim, "#") {
				ignores = append(ignores, slash(str))
			}
		}
	}

	for _, f := range files {
		path, _ := filepath.Abs(filepath.Join(source, f.Name()))
		if f.IsDir() {
			path = slash(path + "/")
		}
		ignore := shouldIgnore(path, ignores)

		if !ignore {
			newPath, _ := filepath.Abs(filepath.Join(destination, f.Name()))
			if f.IsDir() {
				_ = os.Mkdir(newPath, os.ModeDir)
				newFiles, _ := ioutil.ReadDir(path)
				newSource := slash(source + "/" + f.Name())
				newDestination := slash(destination + "/" + f.Name())
				syncList(newFiles, newSource, newDestination, ignores)
			} else {
				content, _ := ioutil.ReadFile(path)
				ioutil.WriteFile(newPath, content, 0777)
			}
		}
	}
}

func shouldIgnore(path string, patterns []string) bool {
	for _, pattern := range patterns {
		match, _ := regexp.MatchString(pattern, path)
		contains := strings.Contains(path, pattern)

		if match || contains {
			return true
		}
	}
	return false
}

func slash(str string) string {
	if runtime.GOOS == "windows" {
		return strings.ReplaceAll(str, "/", "\\")
	}
	return strings.ReplaceAll(str, "\\", "/")

}
