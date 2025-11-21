#!/bin/bash

# ============================================
# Script para compilar Flutter y copiarlo a React
# ============================================

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Rutas de los proyectos
FLUTTER_PROJECT="/home/coboy/Documentos/Proyectos/Flutter/konecta_apps/v.02/flutter_demo_template"
REACT_PROJECT="/home/coboy/Documentos/Proyectos/Flutter/konecta_apps/v.02/react_demo_template"
FLUTTER_BUILD_DIR="$FLUTTER_PROJECT/build/web"
REACT_PUBLIC_DIR="$REACT_PROJECT/public/flutter_app"

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Flutter → React Build & Copy Script  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# ============================================
# 1. Verificar que los directorios existan
# ============================================
echo -e "${YELLOW}[1/6]${NC} Verificando directorios..."

if [ ! -d "$FLUTTER_PROJECT" ]; then
    echo -e "${RED}❌ Error: No se encontró el proyecto Flutter en:${NC}"
    echo -e "   $FLUTTER_PROJECT"
    exit 1
fi

if [ ! -d "$REACT_PROJECT" ]; then
    echo -e "${RED}❌ Error: No se encontró el proyecto React en:${NC}"
    echo -e "   $REACT_PROJECT"
    exit 1
fi

echo -e "${GREEN}✓ Directorios verificados${NC}"
echo ""

# ============================================
# 2. Navegar al proyecto Flutter
# ============================================
echo -e "${YELLOW}[2/6]${NC} Navegando al proyecto Flutter..."
cd "$FLUTTER_PROJECT" || exit 1
echo -e "${GREEN}✓ Ubicado en: $(pwd)${NC}"
echo ""

# ============================================
# 3. Flutter Clean
# ============================================
echo -e "${YELLOW}[3/6]${NC} Ejecutando flutter clean..."
flutter clean
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Error al ejecutar flutter clean${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter clean completado${NC}"
echo ""

# ============================================
# 4. Flutter Pub Get
# ============================================
echo -e "${YELLOW}[4/6]${NC} Ejecutando flutter pub get..."
flutter pub get
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Error al ejecutar flutter pub get${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Dependencias instaladas${NC}"
echo ""

# ============================================
# 5. Flutter Build Web
# ============================================
echo -e "${YELLOW}[5/6]${NC} Compilando Flutter para Web..."
echo -e "${BLUE}Esto puede tomar unos minutos...${NC}"
flutter build web 
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Error al compilar Flutter${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Compilación exitosa${NC}"
echo ""

# ============================================
# 6. Copiar a React
# ============================================
echo -e "${YELLOW}[6/6]${NC} Copiando archivos a React..."

# Eliminar carpeta anterior si existe
if [ -d "$REACT_PUBLIC_DIR" ]; then
    echo -e "   Eliminando carpeta anterior..."
    rm -rf "$REACT_PUBLIC_DIR"
fi

# Crear directorio public si no existe
mkdir -p "$REACT_PROJECT/public"

# Copiar build de Flutter
echo -e "   Copiando archivos..."
cp -r "$FLUTTER_BUILD_DIR" "$REACT_PUBLIC_DIR"

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Error al copiar archivos${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Archivos copiados correctamente${NC}"
echo ""

# ============================================
# Resumen
# ============================================
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║          ✓ PROCESO COMPLETADO         ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Detalles:${NC}"
echo -e "  Flutter compilado en: ${YELLOW}$FLUTTER_BUILD_DIR${NC}"
echo -e "  Copiado a React en:   ${YELLOW}$REACT_PUBLIC_DIR${NC}"
echo ""
echo -e "${BLUE}Siguiente paso:${NC}"
echo -e "  cd $REACT_PROJECT"
echo -e "  npm run dev"
echo ""