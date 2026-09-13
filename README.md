# BS Super Mario USA - Power Challenge
This project adapts BS Super Mario USA as a single ROM with all 4 episodes in one with MSU1 in japanese, as well as a full english version fully redone, also in Satellaview format.

Remember: **Please play an episode until you reach the end with the score screen to make sure to save your progress.**
This is a decision to keep the authenticity of the original version.

This is sort of a score attack version of Super Mario Bros. 2, with a fully voiced story that happens after the original game that will sometimes affect the game.
We hope you will enjoy this english version.

### HOW TO RESET THE SAVE
Hold L+R+X on the controller when booting the ROM until you reach the main menu.
A sound effect will play when the save is successfully reset.

## Japanese Version Staff (Standalone)
- PROGRAMMING
  - **LuigiBlood**

## English Version Staff
- PROGRAMMING
  - **LuigiBlood**
- VOICE DIRECTOR
  - **SinCama**
- GRAPHICS
  - **LuigiBlood**
  - **SinCama**
  - **Clarissa Arts**
- SPECIAL THANKS
  - **Satarou Light**
  - **dollycat9195**
  - **kukun kun**
  - **optiroc**
  - **SatellaViny**

### Cast
- **Steven Medina**: Mario, Birdo Red, Clawgrip
- **Santiago Vargas**: Luigi, Birdo Green
- **Elliott Posadni**: Princess Peach
- **Patrick Wallace**: Commander
- **Ryan J. Hutchins**: Toad, Birdo Pink
- **Emi Mastey**: Narrator, Mary
- **Martin Gustavsson**: Mouser
- **Thomas E. Thomas**: King, Tryclyde
- **Tre'Vaughn Williams**: Wart, Fryguy
### Additional Voices
- **Kitty Kaboom**: Narrator B, Lola
- **Ryan Redding**: Citizens
- **Loren Collins**: TV Announcer
- **Satarou Light**: Soccer Commentator
- **Scottpilgrimrules**: Technical Difficulties
- **Vinny Vinesauce**: Delivery Guys


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
