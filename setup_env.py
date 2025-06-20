import os
import subprocess
import sys
from pathlib import Path

venv_path = Path(".venv")
kernel_name = Path.cwd().name  # z. B. Projektordner-Name

# Erstelle virtuelle Umgebung
subprocess.run([sys.executable, "-m", "venv", str(venv_path)], check=True)

# Pfade zur Aktivierung
if os.name == "nt":
    python_exec = venv_path / "Scripts" / "python.exe"
    pip_exec = venv_path / "Scripts" / "pip.exe"
else:
    python_exec = venv_path / "bin" / "python"
    pip_exec = venv_path / "bin" / "pip"

# Installiere Requirements
# subprocess.run([str(pip_exec), "install", "--upgrade", "pip"], check=True)
subprocess.run([str(pip_exec), "install", "-r", "requirements.txt"], check=True)

# Registriere Kernel
subprocess.run([
    str(python_exec), "-m", "ipykernel", "install",
    "--user",
    f"--name={kernel_name}",
    f"--display-name={kernel_name}"
], check=True)

print(f"Kernel '{kernel_name}' wurde erstellt und ist bereit in Jupyter.")
