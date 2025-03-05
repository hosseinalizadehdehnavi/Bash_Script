### **Batch File Renamer**  

This Bash script removes specified words from filenames in the current directory.  

## **Usage**  

Run the script with words you want to remove from filenames as arguments:  

```bash
./renamefiles.sh <word1> <word2> <word3> ...
```

### **Example**  

#### **Before Running:**  
```bash
$ ls
test_sample_document.txt  another_test_file.txt  example_sample.txt
```

#### **Run the Script:**  
```bash
./renamefiles.sh test sample
```

#### **Output:**  
```
Renamed: test_sample_document.txt -> _document.txt
Renamed: another_test_file.txt -> another__file.txt
Renamed: example_sample.txt -> example_.txt
All files have been processed.
```

#### **After Running:**  
```bash
$ ls
_document.txt  another__file.txt  example_.txt
```

## **How It Works**  
1. Takes multiple words as input and removes them from filenames.  
2. Loops through all files in the current directory.  
3. Renames files only if their name changes.  
4. Prints each rename operation.  

## **Requirements**  
- Bash shell (`#!/bin/bash`)  
- Execute permissions:  
  ```bash
  chmod +x renamefiles.sh
  ```

## **Notes**  
- Words are removed **case-sensitive**.  
- Filenames may contain consecutive underscores (`__`) after removal.  
- Be cautious when running on important files.  

