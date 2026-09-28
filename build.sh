#!/usr/bin/env bash

set -e

echo "======================================"
echo "   Instalando Flutter"
echo "======================================"

FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR/bin" ]; then
    git clone --depth 1 --branch stable \
        https://github.com/flutter/flutter.git \
        "$FLUTTER_DIR"
else
    echo "Flutter ya está disponible."
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

echo "======================================"
echo "   Versión de Flutter"
echo "======================================"

flutter --version

echo "======================================"
echo "   Habilitando Flutter Web"
echo "======================================"

flutter config --enable-web

echo "======================================"
echo "   Descargando dependencias de Web"
echo "======================================"

flutter precache --web

echo "======================================"
echo "   Instalando dependencias del proyecto"
echo "======================================"

flutter pub get

echo "======================================"
echo "   Compilando Flutter Web"
echo "======================================"

flutter build web \
    --release \
    --base-href "/"

echo "======================================"
echo "   BUILD COMPLETADO"
echo "======================================"

echo "Archivos generados:"
ls -la build/web

echo "======================================"
echo "   Listo para Render"
echo "======================================"
