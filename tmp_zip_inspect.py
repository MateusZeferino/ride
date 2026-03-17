from __future__ import annotations

import shutil
import zipfile
from pathlib import Path


ZIP_PATH = Path(r"c:\Users\Mateus Zeferino\Desktop\Projetos\Ride\travelly_flutter_screens.zip")
EXTRACT_DIR = Path("tmp_extracted_screens")


def main() -> None:
    print(f"zip_exists={ZIP_PATH.exists()}")
    if not ZIP_PATH.exists():
        return

    if EXTRACT_DIR.exists():
        shutil.rmtree(EXTRACT_DIR)
    EXTRACT_DIR.mkdir(parents=True, exist_ok=True)

    with zipfile.ZipFile(ZIP_PATH, "r") as zf:
        zf.extractall(EXTRACT_DIR)
        for name in zf.namelist():
            print(name)


if __name__ == "__main__":
    main()
