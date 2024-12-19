<p align="center"> <img src="Img/logo_ENSEA.png" width="15%" height="auto" /> </p>
# TP FPGA
Ce TP FPGA est réalisé par Jean-Philippe THOMAR et Paul BOULOT, sous la supervision de N. PAPAZOGLOU.

# Objectifs : 
Durant ces séances de TP, sur la sortie HDMI, nous allons faire rebondir le logo ENSEA, comme dans les lecteurs DVD (https://www.bouncingdvdlogo.com/).
Mais en premier lieu, nous allons prendre en main le logiciel Quartus qui permet de tester les composants sur FPGA. 

## 1. Tutoriel Quartus

### Création d’un projet
Premièrement, on crée un projet TP_FPGA_Boulot_Thomar et on sélectionne le FPGA suivant : 5CSEBA6U23I7

### Création d’un fichier VHDL
On crée ensuite un fichier VHDL dans lequel nous écrivons le composant suivant : 
```vhd
library ieee;
use ieee.std_logic_1164.all;
entity TP_FPGA_Boulot_Thomar is
port (
sw : in std_logic;
led : out std_logic
);
end entity tuto_fpga;
architecture rtl of TP_FPGA_Boulot_Thomar is
begin
led <= sw;
end architecture rtl;
```

## 2. Petit projet : Bouncing ENSEA Logo
