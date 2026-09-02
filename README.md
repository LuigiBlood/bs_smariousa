# BS Super Mario USA - Power Challenge

## Staff
- LuigiBlood: Programming, Graphics
- SinCama: Voice Director, Graphics

## Building
### Requirements
- bass (ARM9's fork): https://github.com/ARM9/bass
  - Must be in `./tools/bass/`.
  - Tested with bass v18
- SuperFamiconv: https://github.com/Optiroc/SuperFamiconv
  - **Compile/Use the `rust-rewrite` branch, v0.12.0-beta release.** It has major improvements on the conversion process.
  - Must be in `./tools/conv/`.
- Put the original ROMs as:
  - `./roms/bs_supermariousa_ep1.bs` (SHA-1: `7dc4d3d2a11f2f4e05d7306053211131b7aa6d9f`)
  - `./roms/bs_supermariousa_ep2.bs` (SHA-1: `3a64fefc0a2a0c9a666917d0b685474c2073947c`)
  - `./roms/bs_supermariousa_ep3.bs` (SHA-1: `4078d1756b53c230670bd5ae8285629f6173b373`)
  - `./roms/bs_supermariousa_ep4.bs` (SHA-1: `0f8cba643d66d8da0d8d05faefcf65a79b081efc`)
