#!/bin/bash

# Orchestrator Template Setup Script
# Usage: curl -sSL https://raw.githubusercontent.com/auldsyababua/orchestrator-template/main/setup.sh | bash -s my-new-project

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get project name from argument or use default
PROJECT_NAME=${1:-"my-orchestrator-project"}

echo -e "${GREEN}🚀 Setting up Orchestrator Template as: ${PROJECT_NAME}${NC}"

# Clone the template
echo -e "${YELLOW}📦 Cloning template repository...${NC}"
git clone https://github.com/auldsyababua/orchestrator-template.git "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Remove the template's git history
echo -e "${YELLOW}🔧 Cleaning up template history...${NC}"
rm -rf .git

# Initialize new git repository
echo -e "${YELLOW}📝 Initializing new git repository...${NC}"
git init
git add .
git commit -m "Initial commit from orchestrator-template"

# Create virtual environment
echo -e "${YELLOW}🐍 Creating Python virtual environment...${NC}"
python3 -m venv .venv

# Activate virtual environment and install dependencies
echo -e "${YELLOW}📚 Installing dependencies...${NC}"
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows
    source .venv/Scripts/activate
else
    # Unix-like (macOS, Linux)
    source .venv/bin/activate
fi

pip install --upgrade pip
pip install -r requirements.txt

# Create .env file template
echo -e "${YELLOW}🔐 Creating .env template...${NC}"
cat > .env.example << 'EOF'
# API Keys and Configuration
OPENAI_API_KEY=your_api_key_here

# Add other configuration as needed
# ANTHROPIC_API_KEY=your_api_key_here
# LANGCHAIN_API_KEY=your_api_key_here
EOF

# Create initial directories for user content
echo -e "${YELLOW}📁 Creating project directories...${NC}"
mkdir -p data
mkdir -p outputs
mkdir -p tests

# Success message
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo "1. cd $PROJECT_NAME"
echo "2. cp .env.example .env and add your API keys"
echo "3. source .venv/bin/activate  # On Windows: .venv\\Scripts\\activate"
echo "4. python main.py"
echo ""
echo -e "${YELLOW}Optional: Create a new GitHub repository and push:${NC}"
echo "   git remote add origin https://github.com/auldsyababua/$PROJECT_NAME.git"
echo "   git push -u origin main"