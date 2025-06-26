# 🗃️ collect\_files.sh

A simple Bash script to **collect and consolidate files** from subdirectories of a root directory into a single `_all` folder, while **preserving their parent directory names** as filename prefixes.

## 📋 Description

This script scans all subdirectories (excluding `_all`) of a specified root directory and copies all files found into a new `_all` folder under that root. Each file is renamed using the format:

```
<parent_directory>_<original_filename>
```

This helps avoid filename collisions and keeps track of each file's origin.

## 📁 Example

Given the following directory structure:

```
/data
├── project1
│   └── report.txt
├── project2
│   └── report.txt
```

Running:

```bash
./collect_files.sh /data
```

Creates:

```
/data/_all/
├── project1_report.txt
├── project2_report.txt
```

## 🚀 Usage

```bash
./collect_files.sh /path/to/root-directory
```

* Replace `/path/to/root-directory` with the actual path to the root directory containing the subfolders.
* The script will create (or update) a `_all` folder inside the root directory.

## ⚠️ Notes

* Files in the `_all` directory are **overwritten** if a name collision occurs.
* The script **skips** the `_all` directory to avoid infinite recursion.
* The original directory structure is not modified.

## 🛠 Requirements

* Bash (tested on GNU Bash 5.1+)
* `find`, `dirname`, `basename`, and `cp` utilities (available in most Unix-like systems)