## BNECleaners Web Single-Page-Application

Technical instructions for development, building, and deployment.

## Requirements
Two ways to get started. Choose only one of following:

1. RECOMMENDED: Install Nix with [flakes support](https://nixos.wiki/wiki/flakes) and [direnv](https://direnv.net/) (.envrc provided).

2. Alternatively, without nix: Install Node.js and pnpm, and Elm compiler 0.19.1-6 installed system-wide.

## Development (recommended with Nix)

> Checkout: [nixos.org/download](https://nixos.org/download/)

1. Ensure you have Nix with flakes enabled and direnv installed.
2. Ensure the repo's .envrc is trusted by direnv:
   - direnv allow
3. Enter the development environment:
   - nix develop
   This provides a wrapped shell with required tools (pnpm, node, elm, etc.).
4. Install dependencies (inside nix develop shell):
   - pnpm install
5. Run the dev server with hot reload:
   - pnpm run dev
6. Open the app:
   - Point your browser to the address output by Parcel (usually http://localhost:1234).

## Development (without Nix)

1. Install Node.js and pnpm globally:
   - npm install -g pnpm
2. Install Elm compiler 0.19.1 (system install).
3. From the project root:
   - pnpm install
4. Run the dev server:
   - pnpm run dev
5. Open the app at the address Parcel reports (usually http://localhost:1234).

## Build for Production

This repository currently includes only dev scripts. Recommended steps to produce a production build using Parcel:
   - pnpm run build

> _NOTE:_ The static output will be in ./dist (or the directory configured).

## Deployment Options (step-by-step)

> _NOTE:_ SUBJECT TO CHANGE

1. Static-host providers (Netlify, Vercel, Surge, GitHub Pages)
   - Build command: pnpm run build
   - Publish directory: dist
   - Ensure build runs with a node environment that has pnpm and Elm available; for CI, add steps to install pnpm and Elm or use the Nix build environment.

2. Dockerfile
   - Build and run:
     - docker build -t bnecleaners .
     - docker run -p 3000:3000 bnecleaners

3. CI with Nix
   - Use nix build to produce the static output if you add a flake build target that runs parcel build.
   - Typical flow:
     - nix develop — enter environment
     - pnpm install
     - pnpm run build
     - archive the ./dist directory for deployment

## Troubleshooting

- Elm compilation errors: ensure Elm 0.19.1 is available in your environment (nix develop or system).
- pnpm version mismatch: use pnpm@10.x as specified in package.json; global version differences can lead to lockfile issues.
- Parcel port conflicts: change PORT env var or use CLI options.
- Local Dev Environment Port: Check onscreen instructions. Default should be on `localhost:1234`.

## Notes

- pnpm is the package manager of choice; scripts assume pnpm.
- The repo includes a .envrc configured for Nix flakes; using nix develop yields a wrapped shell with required tooling.
- If not using Nix, ensure Elm and Node/pnpm are installed before running dev or build steps.
