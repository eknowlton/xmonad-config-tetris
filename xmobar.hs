-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:Powerline:size=10,xft:Source Code Pro:size=10",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = TopW L 100, 
    lowerOnStart = False,
    allDesktops = True,
    commands = [
        Run MultiCpu ["-t","<total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run CoreTemp ["-t", "<core0> <core1> <core2>", "-L", "0", "-H", "2", "-l", "lightblue", "-n", "white", "-h", "red"] 50,
        Run Memory ["-t","<usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","<usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "wlp4s0" ["-t","<rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run Battery        [ "--template" , "<acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "darkred"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkgreen"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#dAA520>Charging</fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#006000>Charged</fc>"
                             ] 50,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu% %coretemp% M %memory% %swap% IO %wlp4s0% [ %battery% ] [ <fc=#FFFFCC>%date%</fc> ]"
}
