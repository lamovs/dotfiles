# General
abbr -a v nvim
abbr -a cat bat
abbr -a ls "eza --icons"
abbr -a ll "eza -la --icons --git"
abbr -a la "eza -a --icons"
abbr -a tree "eza --tree --icons"

# Docker
abbr -a d docker
abbr -a dc "docker compose"
abbr -a dps "docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
abbr -a dlogs "docker logs -f"
abbr -a dex "docker exec -it"
abbr -a dprune "docker system prune -af"

# Go
abbr -a gotest "go test ./..."
abbr -a govet "go vet ./..."
abbr -a golint "golangci-lint run"
abbr -a gobuild "go build ./..."
abbr -a gomod "go mod tidy"

# Lazy tools
abbr -a lg lazygit
abbr -a ld lazydocker
