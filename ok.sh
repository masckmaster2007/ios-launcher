#!/bin/bash

# Root directory (use current directory by default)
ROOT_DIR="${1:-.}"

OLD_BUNDLE_1="com.robtop.geometryjump"
NEW_BUNDLE_1="be.dimisaio.dindegdps22.POUSSIN123"

OLD_BUNDLE_2="com.geode.launcher"
NEW_BUNDLE_2="be.dimisaio.dindem"

echo "Scanning project in: $ROOT_DIR"
echo "Replacing bundle identifiers..."

# Find text files only and apply replacements
find "$ROOT_DIR" -type f \
  ! -path "*/.git/*" \
  ! -path "*/build/*" \
  ! -path "*/DerivedData/*" \
  ! -name "*.png" \
  ! -name "*.jpg" \
  ! -name "*.jpeg" \
  ! -name "*.gif" \
  ! -name "*.ico" \
  ! -name "*.pdf" \
  ! -name "*.zip" \
  ! -name "*.sh" \
  ! -name "*.framework*" \
  ! -name "*.xcarchive*" \
  -exec grep -Iq . {} \; \
  -exec sed -i '' \
    -e "s/$OLD_BUNDLE_1/$NEW_BUNDLE_1/g" \
    -e "s/$OLD_BUNDLE_2/$NEW_BUNDLE_2/g" \
    {} +

echo "Done."

