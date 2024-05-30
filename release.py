import os
from pathlib import Path
import argparse
import zipfile
import glob

def zip_package():
    # Get all files which should be included
    typst_files = glob.glob("./*.typ")
    typst_files.append("./typst.toml")
    typst_files.append("./LICENSE")

    # Open new zip file
    zip_file = zipfile.ZipFile(Path("package.zip"), mode='w')
    for p in typst_files:
        zip_file.write(p)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="Releaser",
        description="Generate release files for the package and templates",
    )
    parser.add_argument('-p', '--package', action='store_true')
    parser.add_argument('-t', '--template')

    args = parser.parse_args()

    if args.package:
        zip_package()

