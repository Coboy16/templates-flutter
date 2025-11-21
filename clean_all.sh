#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

FLUTTER_PROJECT="/home/coboy/Documentos/Proyectos/Flutter/konecta_apps/flutter_sidebar"
REACT_PROJECT="/home/coboy/Documentos/Proyectos/Flutter/konecta_apps/react/test_react_flutter"

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      Limpieza Completa de Proyectos   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Limpiar Flutter
echo -e "${YELLOW}[1/4]${NC} Limpiando Flutter..."
cd "$FLUTTER_PROJECT"
rm -rf build/
flutter clean
echo -e "${GREEN}✓ Flutter limpio${NC}"
echo ""

# Limpiar carpeta flutter_app en React
echo -e "${YELLOW}[2/4]${NC} Eliminando flutter_app de React..."
rm -rf "$REACT_PROJECT/public/flutter_app"
echo -e "${GREEN}✓ flutter_app eliminado${NC}"
echo ""

# Limpiar cache de React (opcional)
echo -e "${YELLOW}[3/4]${NC} Limpiando cache de React..."
cd "$REACT_PROJECT"
rm -rf node_modules/.vite
rm -rf dist/
echo -e "${GREEN}✓ Cache de React limpio${NC}"
echo ""

# Verificar
echo -e "${YELLOW}[4/4]${NC} Verificando limpieza..."
if [ ! -d "$FLUTTER_PROJECT/build" ]; then
    echo -e "${GREEN}✓ Flutter build/ eliminado${NC}"
fi
if [ ! -d "$REACT_PROJECT/public/flutter_app" ]; then
    echo -e "${GREEN}✓ flutter_app/ eliminado${NC}"
fi
echo ""

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║      ✓ LIMPIEZA COMPLETADA            ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Siguiente paso:${NC}"
echo -e "  ./build_and_copy.sh"
echo ""