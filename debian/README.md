# K40 Whisperer Debian Package

Dieses Verzeichnis enthält alle Dateien zum Erstellen eines Debian-Pakets (.deb) für K40 Whisperer.

## Voraussetzungen

Um das Debian-Paket zu erstellen, benötigst du folgende Pakete:

```bash
sudo apt-get install build-essential devscripts debhelper dh-python
```

## Paket erstellen

Um das Debian-Paket zu erstellen, führe folgendes aus:

```bash
./build-deb.sh
```

Das fertige .deb-Paket wird im übergeordneten Verzeichnis erstellt.

## Paket installieren

Nach dem Erstellen kannst du das Paket installieren:

```bash
sudo dpkg -i ../k40-whisperer_*.deb
sudo apt-get install -f  # Falls Abhängigkeiten fehlen
```

## Was wird installiert?

Das Paket installiert:

- **Programmdateien**: `/usr/share/k40-whisperer/`
- **Startskript**: `/usr/bin/k40-whisperer`
- **Desktop-Eintrag**: `/usr/share/applications/k40-whisperer.desktop` (erscheint im Menü unter "Grafik")
- **Icon**: `/usr/share/pixmaps/k40-whisperer.ico`
- **UDEV-Regeln**: `/etc/udev/rules.d/97-ctc-lasercutter.rules` (für USB-Zugriff)
- **Dokumentation**: `/usr/share/doc/k40-whisperer/`

## Nach der Installation

Nach der Installation musst du deinen Benutzer zur Gruppe `lasercutter` hinzufügen:

```bash
sudo usermod -a -G lasercutter $USER
```

Dann **melde dich ab und wieder an**, damit die Gruppenmitgliedschaft wirksam wird.

## Abhängigkeiten

Das Paket installiert automatisch folgende Abhängigkeiten:

- python3-lxml
- python3-usb
- python3-pil (Pillow)
- python3-pyclipper
- inkscape

## Programm starten

Nach der Installation kannst du K40 Whisperer auf folgende Arten starten:

1. Über das Anwendungsmenü: **Grafik → K40 Whisperer**
2. Über das Terminal: `k40-whisperer`
3. Über den Anwendungsstarter (Alt+F2): `k40-whisperer`

## Paket deinstallieren

```bash
sudo apt-get remove k40-whisperer
```

Oder um auch Konfigurationsdateien zu entfernen:

```bash
sudo apt-get purge k40-whisperer
```

## Struktur des debian/-Verzeichnisses

- `control`: Paketmetadaten und Abhängigkeiten
- `rules`: Build-Regeln für das Paket
- `changelog`: Versionshistorie
- `copyright`: Lizenzinformationen
- `compat`: Debhelper-Kompatibilitätslevel
- `k40-whisperer.desktop`: Desktop-Eintrag für das Anwendungsmenü
- `k40-whisperer-wrapper`: Startskript
- `97-ctc-lasercutter.rules`: UDEV-Regeln für USB-Zugriff
- `postinst`: Skript, das nach der Installation ausgeführt wird
- `postrm`: Skript, das nach der Deinstallation ausgeführt wird
