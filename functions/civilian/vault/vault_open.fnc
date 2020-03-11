
cursorTarget animate ["vaultLockAnim",0];
waituntil{cursorTarget animationPhase "vaultLockAnim" == 0};
systemchat "0";

cursorTarget animate ["d_l_Anim",0];
waituntil{cursorTarget animationPhase "d_l_anim" == 0};
systemchat "2";
cursorTarget animate ["d_o_Anim",0];