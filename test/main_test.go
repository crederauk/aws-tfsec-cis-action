// new to golang, forgive me for the following monstrosity :<

package main

import (
	"errors"
	"fmt"
	"io/fs"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/aquasecurity/tfsec/pkg/externalscan"
	"github.com/stretchr/testify/assert"
)

func TestCustomChecks(t *testing.T) {
	filepath.Walk("../.tfsec", func(rulePath string, info fs.FileInfo, err error) error {
		if info.IsDir() || !strings.HasSuffix(rulePath, "_tfchecks.json") {
			return nil
		}
		t.Log(fmt.Sprintf("\ntesting file: %v\n", rulePath))
		ruleName := strings.ReplaceAll(rulePath, "../.tfsec/", "")
		ruleName = strings.ReplaceAll(ruleName, "_tfchecks.json", "")
		for _, expectedResult := range []string{"pass", "fail"} {
			for num := 1; ; num++ {
				examplePath := fmt.Sprintf("../examples/%v_%v_%v.tf", ruleName, expectedResult, num)
				if _, err := os.Stat(examplePath); errors.Is(err, os.ErrNotExist) {
					if num == 1 {
						t.Log(fmt.Sprintf("test example missing: %v\n", examplePath))
					}
					break
				} else {
					tempDir := t.TempDir()
					defer os.RemoveAll(tempDir)

					ruleFile, err := ioutil.ReadFile(rulePath)
					if err != nil {
						t.Error("failed to read rule file")
					}
					os.Mkdir(fmt.Sprintf("%v/.tfsec", tempDir), 0777)
					err = ioutil.WriteFile(fmt.Sprintf("%v/.tfsec/%v", tempDir, filepath.Base(rulePath)), ruleFile, 0777)
					if err != nil {
						t.Error("failed to write rule file in temp dir")
					}
					exampleFile, err := ioutil.ReadFile(examplePath)
					if err != nil {
						t.Error("failed to read example file")
					}
					err = ioutil.WriteFile(fmt.Sprintf("%v/%v", tempDir, filepath.Base(examplePath)), exampleFile, 0777)
					if err != nil {
						t.Error("failed to write example file in temp dir")
					}
					scanner := externalscan.NewExternalScanner()
					tempDirAbs, err := filepath.Abs(tempDir)
					if expectedResult == "fail" || num > 1 {
						os.Remove(fmt.Sprintf("%v/.tfsec/%v", tempDir, filepath.Base(rulePath)))
					}
					scanner.AddPath(fmt.Sprintf("%v/", tempDirAbs))
					results, err := scanner.Scan()
					if expectedResult == "pass" {
						for _, result := range results {
							assert.Equal(t, strings.HasPrefix(result.RuleID, "custom-"), false, "expecting no custom error but found at least one")
						}
					} else {
						foundCustomFail := false
						for _, result := range results {
							if strings.HasPrefix(result.RuleID, "custom-") {
								foundCustomFail = true
								break
							}
						}
						assert.Equal(t, foundCustomFail, true, "expecting custom error but found none")
					}
				}
			}
		}
		return nil
	})
}
