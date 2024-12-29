package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

const (
	lineToCheck = "source ~/.config/dotfiles/zsh_my_stuff.sh"
	zshrcFile   = ".zshrc"
)

func main() {
	// Get path to ~/.zshrc
	homeDir, err := os.UserHomeDir()
	if err != nil {
		fmt.Println("Error expanding path:", err)
		return
	}

	zshrcPath := filepath.Join(homeDir, zshrcFile)

	// Check if line is already there.
	if lineExistsInFile(zshrcPath, lineToCheck) {
		fmt.Println("✨ zsh already configured")
		return
	}

	// Write source zsh if needed
	if err := appendToFile(zshrcPath, lineToCheck); err != nil {
		fmt.Println("Error appending to file:", err)
		return
	}

	fmt.Println("🎉 Line added to ~/.zshrc")
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

