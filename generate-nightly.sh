#!/bin/bash
#
# NZ:P Switch Emulator Edition — Switch-only release packaging.
#
# Assembles the Nintendo Switch package: game assets + QuakeC progs + the .nro engine,
# zipped into nzportable-switch.zip under out/.
#
# This fork builds ONLY the Switch target. The prebuilt artifacts are pulled from GitHub
# release zips below. Point these at YOUR fork's release artifacts:
#   - .nro   : produced by CollectingW/quakespasm (Makefile.nx)      -> nx-nzp-nro.zip
#   - progs  : produced by CollectingW/quakec      (standard build)  -> standard-nzp-qc.zip
#   - assets : upstream NZ:P assets (GFX/sound/maps; not redistributed here)
#
# NOTE: confirm these release tags/filenames exist on your forks before running.
set -e

BUILD_STRING="2.0.0-switch+$(date +'%Y%m%d%H%M%S')"

# --- artifact sources (edit to match your fork's releases) ---
ASSETS_URL="https://github.com/CollectingW/assets/releases/download/newest/nx-nzp-assets.zip"
QC_URL="https://github.com/CollectingW/quakec/releases/download/bleeding-edge/standard-nzp-qc.zip"
NRO_URL="https://github.com/CollectingW/quakespasm/releases/download/bleeding-edge/nx-nzp-nro.zip"

# --- fetch ---
wget -nc "$ASSETS_URL" -O nx-nzp-assets.zip
wget -nc "$QC_URL"     -O standard-nzp-qc.zip
wget -nc "$NRO_URL"    -O nx-nzp-nro.zip

# --- assemble Switch package ---
rm -rf nx-assembly out
mkdir -p nx-assembly out
cd nx-assembly
mkdir assets
unzip -q ../nx-nzp-assets.zip -d assets/
unzip -q ../standard-nzp-qc.zip -d assets/nzportable/nzp
unzip -q ../nx-nzp-nro.zip -d "$PWD"
echo "$BUILD_STRING" > assets/nzportable/nzp/version.txt
cp assets/nzportable/nzp/version.txt ../out/build-version.txt
mv nzportable.nacp assets/nzportable
mv nzportable.nro assets/nzportable
cd assets/
zip -q -r ../nzportable-switch.zip ./*
cd ../
mv nzportable-switch.zip ../out/
cd ../

# release metadata the workflow expects
echo "$BUILD_STRING" > release_version.txt
cat > changes.txt <<EOF
NZ:P Switch Emulator Edition — automated nightly ($BUILD_STRING).

Install: extract the \`nzportable\` folder from nzportable-switch.zip into \`/switch/\` on your SD card (or your emulator's sdmc) and launch via Homebrew.
EOF

echo "Done. Switch package: out/nzportable-switch.zip ($BUILD_STRING)"
