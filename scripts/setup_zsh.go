package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

const (
	lineToCheck = "source ~/.config/dotfiles/zsh_my_stuff.sh"
	zshrcPath   = "~/.zshrc"
)

func main() {
	// Get path to ~/.zshrc
	path, err := expandPath(zshrcPath)
	if err != nil {
		fmt.Println("Error expanding path:", err)
		return
	}

	// Check if line is already there.
	if lineExistsInFile(path, lineToCheck) {
		fmt.Println("zsh already configured")
		return
	}

	// Write source zsh if needed
	if err := appendToFile(path, lineToCheck); err != nil {
		fmt.Println("Error appending to file:", err)
		return
	}

	fmt.Println("Line added to ~/.zshrc")
}

func expandPath(path string) (string, error) {
	home, err := os.UserHomeDir()
	if err != nil {
		return "", err
	}
	return strings.Replace(path, "~", home, 1), nil
}

func lineExistsInFile(filePath, line string) bool {
	file, err := os.Open(filePath)
	if err != nil {
		fmt.Println("Error opening file:", err)
		return false
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		if strings.TrimSpace(scanner.Text()) == line {
			return true
		}
	}

	if err := scanner.Err(); err != nil {
		fmt.Println("Error reading file:", err)
	}
	return false
}

func appendToFile(filePath, line string) error {
	file, err := os.OpenFile(filePath, os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		return err
	}
	defer file.Close()

	if _, err := file.WriteString(line + "\n"); err != nil {
		return err
	}

	return nil
}
