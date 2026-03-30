#!/bin/bash

echo "🚀 Setting up Linux Log SIEM Platform..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Create directories
echo -e "${BLUE}📁 Creating directories...${NC}"
mkdir -p logs/sample_logs output/{alerts,reports} data

# Create sample logs
echo -e "${BLUE}📝 Creating sample log files...${NC}"

# Create sample auth.log
cat > logs/sample_logs/auth.log << 'AUTH_EOF'
Jan 15 08:30:15 server sshd[12345]: Failed password for invalid user admin from 192.168.1.100 port 54321 ssh2
Jan 15 08:30:17 server sshd[12345]: Failed password for root from 192.168.1.100 port 54322 ssh2
Jan 15 08:30:20 server sshd[12345]: Failed password for user john from 192.168.1.100 port 54323 ssh2
Jan 15 08:30:25 server sshd[12345]: Accepted password for john from 192.168.1.101 port 54324 ssh2
Jan 15 08:31:00 server sudo: john : user NOT in sudoers ; TTY=pts/0 ; PWD=/home/john ; USER=root ; COMMAND=/bin/su -
AUTH_EOF

# Install Python dependencies
echo -e "${BLUE}🐍 Installing Python dependencies...${NC}"
pip install -r requirements.txt

# Make scripts executable
echo -e "${BLUE}🔧 Making scripts executable...${NC}"
chmod +x scripts/*.py

# Success message
echo -e "${GREEN}✅ Setup complete!${NC}"
echo -e "${BLUE}🚀 You can now run the SIEM components:${NC}"
echo "  - python scripts/log_monitor.py"
echo "  - python scripts/log_analyzer.py"
echo "  - python scripts/alert_engine.py"
echo "  - python scripts/visualize.py"
