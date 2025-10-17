#!/bin/bash
# Build script for K40 Whisperer Debian package

set -e

echo "Building K40 Whisperer Debian package..."

# Check if required tools are installed
command -v dpkg-buildpackage >/dev/null 2>&1 || { 
    echo "Error: dpkg-buildpackage is not installed. Please install it with:"
    echo "  sudo apt-get install build-essential devscripts debhelper"
    exit 1
}

# Make sure we're in the right directory
if [ ! -f "k40_whisperer.py" ]; then
    echo "Error: k40_whisperer.py not found. Are you in the right directory?"
    exit 1
fi

# Make debian/rules executable
chmod +x debian/rules
chmod +x debian/k40-whisperer-wrapper
chmod +x debian/postinst
chmod +x debian/postrm

# Clean previous builds
if [ -d "debian/k40-whisperer" ]; then
    rm -rf debian/k40-whisperer
fi

# Build the package
echo "Building package..."
dpkg-buildpackage -us -uc -b

echo ""
echo "============================================"
echo "Build complete!"
echo "============================================"
echo ""
echo "The .deb package should be in the parent directory:"
ls -lh ../k40-whisperer*.deb 2>/dev/null || echo "No .deb file found yet - check for errors above"
echo ""
echo "To install the package, run:"
echo "  sudo dpkg -i ../k40-whisperer_*.deb"
echo "  sudo apt-get install -f  # To install any missing dependencies"
echo ""
