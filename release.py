from pathlib import Path
import argparse
import zipfile
import glob


class Writer:
    def __init__(self, zip_filename="package.zip"):
        self.zip_file = zipfile.ZipFile(Path("package.zip"), mode="w")

    def write_to_zip_file(self, entries):
        for p in entries:
            self.zip_file.write(p)


def zip_package(writer):
    # Get all files which should be included
    typst_files = glob.glob("./*.typ")
    typst_files.append("./typst.toml")
    typst_files.append("./LICENSE")
    typst_files.append("./README.md")
    writer.write_to_zip_file(typst_files)


def zip_templates(writer):
    folders = glob.glob("./templates/*")
    files = list(glob.glob("./templates/*"))
    for folder in folders:
        files.extend(glob.glob("{}/*".format(folder)))
    writer.write_to_zip_file(files)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="Releaser",
        description="Generate release files for the package and templates",
    )
    parser.add_argument(
        "-p",
        "--package",
        help="Do not zip peace-of-posters package files.",
        default=True,
        action="store_false",
    )
    parser.add_argument(
        "-t",
        "--templates",
        help="Do not zip template files.",
        default=True,
        action="store_false",
    )

    args = parser.parse_args()

    writer = Writer()
    if args.package:
        zip_package(writer)
    if args.templates:
        zip_templates(writer)
