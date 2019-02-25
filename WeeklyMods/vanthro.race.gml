#define init
	/* Anthro Van
	 * Character from /ntg/. Here's to you
	 * Active: 
	 *          Summon Frenzied Vans.
	 * Passive: 
	 *          Enter each stage in Hyper mode
	 *          Killing enemies extends your Hyper time
	 *          More IDPD Chests
	 *          [UNDOCUMENTED] Bosses drop Strike ammo
	 * Thronebutt: 
	 *          Summoned Vans last longer
	 * Ultra A: 
	 *          Increased Vans per summon (2 --> 5)
	 * Ultra B:
	 *          Increased Hyper Damage (+6)
	 * Ultras(Both):
	 *          IDPD drop Strike ammo 
	 *          (5% Grunts, 10% Common, 20% Elites)
	 *          (Freaks are not IDPD anymore, nor are they people)
	 */
	 
	 /* Hyper Mode (Road Rage)
	  * Enter each stage in the same manner as a regular van
	  * (Being, to charge in and ram everything). Killing an enemy
	  * by ramming into them returns time to your charge in proportion
	  * to their max health, though it can never go over the maximum 
	  * value. 
	  * Additionally, you are 100% invincible in Hyper mode. Enjoy.
	 */
	global.Ultra[1] = 0;
	global.Ultra[2] = 0;
	global.Ultra_Taken = 0;
	global.ent_list = ds_list_create();
	
	with(instances_matching(CustomDraw,"name","vanthrohud")){
		instance_destroy();
	}
	with(script_bind_draw(vanthrohud,-11)){
		name = "vanthrohud";
		persistent = true;
	}
	global.sprVanPortraitSmall = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QYMFRw4AMKsxwAAAZBJREFUOMudlLFLAlEcx7/vkKhFBVsSKjA4TkO0ySM4GnQThKaGMISL2vtDrKVBcWhp8A9wqXMSwTYjChFMEtFF4XSx7TVc9+7SO3v6m+5+9/t83+/97n0fEWWF4jfajRoAQJQV8IZgh/dvKHxVyoS4BUxYTxvJVUSEeRgA/BXwd+AEf+UJ9xyIr0rpujAACE/b3bVhACC3Dxo9PgohEQutBJoLkZfXT5qIhZBJZ12Le53hQq7Z0iDKCggA6gQ7QU4iJJPOUl7A9SD1OkOUohpKUe1fwF431gfWUQaAsGoUjPWBKxxWwWAA8My3HlaBlvoBKQcE/EGWr99py820bjCBy7cUS0q5CAL+IArlIgrlIsb6AFIuwr6f1qxnEpdS7Cib+zJbd5uFPTz2FxMslIuOxddnVwuiQrOlORbywCO9DyLKCm03aohL1gx4Wh/pfezGY4aAeSttbXq5Jj/7njIz/ZnBRmUC7/nhUnj6+I5Zklh/wdyCr0pxkr9gRto72HE1Vvf+GZOkcXd43BzIa64fVsy0ZBB4cJMAAAAASUVORK5CYII=",1,0,0)
	
	global.sprVanIdle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAADIklEQVRoge2ZvU8bMRjGn6sqkSxhi9SlhHQgDJBUqkAqI2HszMISgWBgifhDIpZWAtENqUL9E5pMFZVgKZShZWg+ulTq1nZomdzh8OWSs+Ozz+/lrrpHipTcx+/1+9jnvPYBmTLFJDbtBiRc1P4kkv8gLHzugBkHCRuDkE3Np/YnsfwwA4jDQZhEYg3SYFP5k2i+MwnsgwIABi1HdY+JGHEMKj61P6ngT5yBLq67aC53/HAeWPTRFQPt4KHmU/uTCr7MTDZ3wNBc7uD50zJWq2XUKnXhhY+fPMK3r99x9aU9iSeMcXHdxYePXRx+WvcnoNvWafCp/UkNXxRQ9NRKAxgmkRqDZGwuAn9SxR8PNgL/8WoWALBQWlG0aagQSWgnoME24mt0QMCfMN5wPqDMgdp/63zpDDRoOcjnCt7B9y9+AQB2bsQdcbLUBgA8eyvlemwungA1n+IB8PtDzQes+WOdLyqiHVm9sLgNnB+6oKOzYxydHQNwjy1uT2iygC2KQcW/7V/iZKntmSCS6rwoRlx8Lgv+WOc/lAXBWOW9c1PHOYYG7G3uBm5yR6/SJGfQcgJVPTUfuDcIbaw16545e5u7nmmfX6vQwxgQrEwo+Rb9scqXDaAR8Sl6relOb9wcrjVBMIVGEqDmA9Y7QHgvFZ/AH2t8ZUEKiAtQ/xPGpbtSmlRDiPiaMaT8cYOi5AAE/ZHxTbY6RHx/jAhtt8IP1RHFRg93WyUAwPz+xjhQlzfCBsKtwHzxktQBgMQfzl+tlv3XmmxiUvofBx8snyuwWqXOapU6m+2wwHdEez/Dio2ex/LzYWG3NQ4+tT9J5od9Gw/AXW3MnPa93zOnfdz2L41bzvX7TRXz+xsBfrHR8y81jV9BUPPjEpX/UfhaA2ihtOJNdQBwt1XS2gP53/nUHZxEf1QDiBUbvbDxjV6oavBNFCtf0QHU/kyFH2oZ/+evu0vZe/kOP9cdXPET99/zuYJ3DaEYaP9mjPnU/qSZ7xWYkmKK5XOFSAWogB/4RIgxDf7IeQJ/EsXX2u8QXC87risVP2qMafOp/Uk6P1OmTJkI9A+5I36CFd/wUQAAAABJRU5ErkJggg==", 6, 12, 12);
	
	global.sprVanWalk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAADAFBMVEUAAAAJCA4wKEROS13MVQD1uAAWYd8fcv8Pvf+PoLzJ0d4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB6+VogAAAADHRSTlP//////////////wAS387OAAABiElEQVRIia1Wi5KDIAzc5HxQ+f//PQJWBZOIVabTqcm+iIMW8XLhGtK1+nSg/GoQwejcK0fMXYTtysIjBD2RQbDyY567CN8LAw8nj07Q8XDy1AT4eCyfgHV1GJj5k86s67QE+Pj5s4Dz+uNqHzrBzB9snYYAD5/HsDaqjkGw8ucxqDpnAhy85CHifcE3sPILXNdRCHDwcpCIaBhKeRjgGpj55SCpOhoBNl46uTGOvCw8jgOuDO7qKAQ4eOmkRioJPn3jyuAFHXj43JDiktbxHpgGz3Xg4mUPXDp13SC8oAMXL50pBCmenmi6wWMd+HjZA3OQT1s3DJ7qwMcnGDFNzBP1GVi+sVcHPj49cjZCMwqDYPkGa0IN4WpC+Q6XBh1NLAPzzgSRIm5fvScdGPVjIuD8wjwQqsOUyqTqAEUqNnUJSlqgLN+MYVWKytqDUh2Ii776H6Q9eVvQw2b3Y19GYPifxVdgnSd+R9lua+uq5erBsWG7cigealUP1CPyY44bDnepL8Z4Zf0DQqpoQmFlT/MAAAAASUVORK5CYII=", 6, 12, 12);
	
	global.sprVanHurtDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAADY0lEQVRoge1aPU8bQRB9G0XCbkxnKSlixyl8aeBojJQ2zk9AaSjiIkmRhvA/gtIkEtQ0/INI4JYIhASkCRTBJk2kdCAFQzUp7Dvuzrt3O3e7/oB70kq27vxmd2b27e6sgRw5bIOIyLaJKee/t3iQ9IKXPBaTiCqrfRNTyn+vIeIeypJGCBH7Gya84AIAztdEYp8mjP/eQ+pMldoYTB4CAIvBtc2fY4DEJSwIUiCN4b3jM6zMtQH4wQX6gZe1iePP0cfQjEybEAx1osoqYWWujRcLNSzO1+A6TemLT549wu9ff3B0siPt65j4cwQQclrWjbJGEsn2JMoAA+wgh/i7nwAhBJufiMjwXu/O4lbbDZ2yYhwfCu7fr7O46l1g4fkrbe6jkx0QkcrGED8A1KsNFj9yJSIwfGBUgYBEFaLKKuF8TaBYKAEArnoXoReiCXX4czsTf9RGHP+AOlMCjUC9WAHmcnv+07UR2kSPQLZFYEM7lDwe1rc2sL61IX2WkOQ+v4o7iV/DRuLvprRm5is4xwbrGK9FqJeEFFQI3WWGscTY5h82OL01s0wlj4cGOpAJsuAG1eH963cTzX8HambYOz7D7mEbn3+8jJY8ZAjZlSaQEEKkUSGG00Tv+lLKrwouUx1s8ycizn/c5GIGGGCWPHYP+yWPj2/UJ9bAaTW0B2NfZSh7nG7GUbnVwc1yFQDw9MPtBncQ0JCJSeMfVdlDp6YFDJUkgPgxGSmpGEmgDHJNxULJX2Y6X7b9IHufMyqDNf5Rlz10AgzcBhmIVVVjJQ/WVYZNnHb3MbPZ9b/PbHZx2t2fSP5R/L0lGuBioZSYPAD85EmAf1oNnorT+MNIAplwaL3a8JcaALhZrgZnxNj5s979JaFYKFGgwVSAVTZcpxniTgtlAnEdlcKxVG51tF4cHMnHxm9bcYqFUoi/Xm3AVIBlNryJo6NoqaG6eY8D10S51SEA5DpNmm2T9KZ8MPA0t+bG+NP4guOziPqEmtfHgWrQwRLo37d+c50m7R2f+c11mv6zg6XwmLLyq7jH/ocy74PrNG3cRRnlTzFJYhH1ZVSJPPSuLwHwFEM1VpkNLr/2KcyD5ziLVx3eoKaKP0tC6Vbsg1/KrQ4ef38LALFXMYvzNUCzYs/lZ3DnyJEjh2X8B41zQ5edF8N8AAAAAElFTkSuQmCC", 6, 12, 12);

	global.sprVanChrg = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMAAAAAYCAYAAACssfJFAAADJ0lEQVR4nO2asUsbURzHPykFFdFsgS4l0cEsJRGKBTsaQSidi+ASKO3g0j/BrauLg1JwEUT6DwgmQykKupjQRQdNqEPBLYqoXV6HJK93Se7u3V2eCvl9IaBn8v19ft/j5fneOxCJREZSjw0QU8L/uHqS/M8M36eSZQV2m7DqLfzBNWx6P1V+kwHQhsdiEypVrFnzFv7gGoPKn/AzBQ0NQGMuEfSZKGrDA3C5melXDeE3rDPI/L4zwGH1nJWLMqDhodlYr1dYKeyFDwh/gIQfeO5lnirWODg+Y3Z6gkYuwc0uvP1S6Hrjy8kX/D77Q+WkpG52YXTBHOCwes7B8Rlff0y24cE7jDCNCb/wG/H3uthrVJHPFthfLfVsAmB/tcTognehzhrJsmLloszs9ARvchMmAWEYkPALvzF/ZzEX/PV2DoCp9IwLtLOQ81rlpBTUhOrxf2G/AhJ+4Q/F7zkDXG5mGBke1xd/vr8C4OOvZoH1nQ0APn/4BMC3VyUAXn/39O2C//suCfQ/IOEXflN+z0KAqwFnET+ZjuDGXMJGQMIv/KH4fQsFNdBZxLABsBuQriH83t4g/GB4Euxn7oQPIaOV/vrOhg4pjoS/S8Lfktc2KEDi9u7Kd3+2Ez7Et4NLFgIC4TfWIPMbTWWpYo37pTQAmeV5/YcWcFg/lzc0V/AmihiQ8Pt4g/AHFhkZHlf5bEHlswWVLKuun9sgEaVSxZpKlpXL2+Eb57RQ+IXfl9/0aVAtx5E2Q1t1TutHEbn/63o7R2Z5nszyPLW1PX09WVbO0R37iP60fsTQVl3/7uQfGR6PfBMeih8k/16Kw280AMYWqxo0ny3oqet+KW28+vbT7V1zC8svoH5oKj2jp2Jw848tViPfBNv8kr+/4vAbzwDtIj6K9EBTqljT21l+AcXxtyjb/FqSv7d/HH6/XSAtx4NG+tunclKCuQQVmvuxBjfIU3E+G8a/trZHo8UMuPg7Ty6j+NuS5G/mb1u9FhKqNW1FXiC1X+1FEd0Llzg1XP4eHk+ZP4hT8n+4/H0B+uXT7xvc6W9LtvmD6vbLR/IXiUQi0YDoH1xC7CBn8Zm7AAAAAElFTkSuQmCC", 8, 12, 12);
	
	global.sprVanSit = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAYCAYAAAAF6fiUAAADMUlEQVRoge2ZMU/bQBzFn6uKJEuyWYIBDAxJBkoqValaRsJHqLJksSDJwIL4ICgLlaBUHRoJsVZiwhlTVFSptAwNAzgwFCkbZWiZrkN6h33xOXe2A0jJkyKiO/v3zvfs/10MMNJIAMiw8p/ch0k/7tQ6GVq+bACDugjKxbDyNRUTALjY0GTP82UCbNBOrkiqfiJ+2HFHzvc7YZAXQb58P8fnb+eo/VjExYaGXKbgeeDk7Dg+7X9U9e3h95FywFHxfQMY0EWQqXWCtWcNvH4+g5fzM8LJp1IMQYkfIOBI+SJTaZPJ2XFcnl3huGXJXIRXOcPXN8DKiTd/Z84C0O2X8PDkRxhw5HwvQ2UTyRBc3M7bFNJGHjtzFrLL3baFNbdHs9ad/J/vpQLw5KvoIfj8LqjHJBFP9k348uwKAAtJtBPQaJgXGxr+/P3tedDW3ja29rZ9/VT4O3MWmjWLhekUbadPWVC+3/n9+vkAXCZUp+0jmQHKSOMXcr70VIsVVIsVV5uoPMnweYUIWMjPLt89rU5+s3b3dIv0VGDScxc7a7GXaP+Llr8hPCaHlh5+Yha4ICTl4q+cFNDE3R3Ih0uPeSi+VwDUpCeE7DLQhIWFtQKbrGqx4qrVCtKOWxbJZQr49eodbksGqsUlF9fePECs3sbEYVl2kfdUxAFHyvfdUSTiSQBQWmwCTBTRTRu3JQMAML26BACwNw8AALF6G50P06pMxubXL2fATgUMODS/77YL6N0B8UlTs6AXkYgnkTbysDcPXAFMry7htH1EF7ygPwBZwJRNx5pqkLAB3wcfRDdtkmoQkssU2N9cpkDQDcj5CcRPxJMk1SBEN23Gpp6JeDIMm/H5sdPvD82Xehl3szvP7sZYvc3addMGLVMIWCJ002YlbuKwzDro97SRh27aQMgXafzYY/V2lLu7wHyV19FIG3lWqwHgtmQo/xi5Z7GAx/avewIe278OG3BovmgX5DK42Z0PMDY5sR3OooZjvvN/Ww5ldAY2gsctops2q3GiOofga4DseaH4gvXKq++x8YUg1yeChWyQ6je20ItwGL70K1jB8U5wVP/sGGmkkYZG/wC5PmNKa4rUUQAAAABJRU5ErkJggg==", 4, 12, 12);
	
	global.sprVanSit2 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABc0lEQVRIie2UPU/CUBSGnxrDxwJbExmE4AAMIC6Y6Nr/4NwAuhJ+CHEywbDJwmrCRkdCZNKwyGLL6oaLbtehaYX29iMQEwff5CbtObnvc879gj8isevEgzjm+a7YGaLENAdg1VPizIkFEAD7mkPIEj29vNGpGZvmDlg2AiWrSOS7gk7N4OKsyPlpkXpZCzQ4PjnicfwQ5OULytY8FBAF2Qxsmb/fZSkVGqHGXj2/TnyQzT1QnIpXPYXPrw8ABtUJg+ok0DQq791kRXZaKk2Y3tom/dE9/dE9YMcqzeCOAA4lsS3z1kJjyk+FN1fXvgmtRfAeyQA+XXZsA6dyNy6BeRV5k70nyIF4O5FtcFwJVTdF1hCiXtbcAYisIYSqm5GXLRKQTmVEvaxtQZzvdCoTCojzmgKwtOYkh5b7nxxaLK155LwogFB1k1KhQWK8Jjdru4ncrE1ivKZUaKDqJgR0EbuD35LAPklBr6g3tztkj/y/wvUNgqKbkiM/RlMAAAAASUVORK5CYII=", 0, 12, 12);
	
	global.sprPortrait = sprite_add_base64("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",0,50,236);
	
	global.spr_mapicon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsSAAALEgHS3X78AAABTklEQVRIie2UIU8DMRTHfyUEjccUhyEhganZ20dAIQjJEgwCgeETYBCztywhiImFL4A4O7NjCQkGtxn8DIaQHOLuul7X3t44g+CfXNL0tb9/33u9wh9RVnwbS0ngu0nOXkRKusdoSwLfGc4BKIw2yqTOwMC/zrQbW5kIKZRu9vmcD/a2lwcuSiRleIMZQAkHaF9HtSd8fU9qjRRWTctmfnwrEdxjtGKisG4JYGqurzpieJ1JpclN4ABHBxE4t6x0M1nY8HHP1NdbLl/czaLMQC0iVbkl415CMsnHyaQKk8RdA4B974qGWvcnN5bdcQ3Mikb9Wm4PbIPs5bS6uPuWm8WjPmk6ZXAfe6GDw2r9T56WbFGJ0nRKq3VMPOrTvbmUbDHyPhW+Mq3LAvzPhmugH+7Oubh9nIWMpODgRGkCGCOBgi9qKKCF4Llw3b/C+gHVLn2RllScVgAAAABJRU5ErkJggg==",0,12,12);
	
	global.spr_ultrabutton = [sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAD50lEQVRIiZWWS2gbVxSGv1FGtmT8lFLJdWsqhVCUgILaaNUsApW8cRfGEDeUtqQQkxC8CXgTMAmFYrryuthtFk0f4KoQskgptbLwrgWXmg40WphIQbiOlEqKYluR/FIXo7nzVOwcEMy95/H/59xzr44E15q0kXDoZDuVSbK5tbY6+bDAL15UKVces7fXQJIkZLkTny+Ep7PHZu8EJFkzMAZ//vwJm1tFdna+tTkOBm/i9fbT2NnmYH8XSXLh8fTaQEwZGIMfHOxTrjym2fyJWCRpA1jNfAHAygTEU/q+ur5mB7DWu16viuDfRNOAHmhlAuIZiEWSTCqwMpFmUlHt4ino6tqjVpN1AGPwbG7awjQNUTV434Mm1YREPIUJ2ChqBl8zGLzFk8JTc4myuWnHcsRTafoe2JttUkm2WadpNDYJh04iw1dkczZflXlLnILfO/s6AGN/bgAwv7jA1YtX1P2znxL6cR13R5eagTHAakICYPtXdT3kVnX99+HZBzrAWz98Z2fVAlzNpHnzjVncbg8S0LQy/HdXMq1P/9Y0BQ9PjZj0pXKBfFER656eKY77TwDgkuWPqSb0gP337ayMwZ3E7wsSiyQZDkQBRHAAudnU2WtlGKIpsjh3PUkYM+OXAYHaLOHQnAogyx0MDX1JPiFBq1ThqRHOoXdIqVwQzlax6vy+oKlcLrfby95uXWz0fnTmSGxfJsOBqLhPrg53F/+VHgFQTUiCTalcoFQuCFbadzv2VntNZI+nl8bOFgMDMxSLs8L47nk1zfFlPXVrQCOw0d4I4Ors7Cbw2tvUamWxqRmfugyZOwp3zyuOtdaIZO4onLps9hUA2sf+/q5JoTk8vK0DGctUKhdE4Ie3zT6OAEcRIzsr03YiAI4d67ApNfaHiTGLtgBeT++RGL2qCIDu7uOAWtvx5aiNkRNDJ5vx5ajprKRwaE68FfXGJhsbnxOLJE2tqon1/bf+4YwvR/H7gqxm0vpTYTTQJgWtJScVvS3nFxe49Ncj3nvnBFcvXnEE9PuwXUhbF4VDc+SLiuPN1eTSjRvMLy7Y9rVnW2MPIGdza44DVr6okC8q4gm+MDLGz0v3hP7CyJjNHiAYmBF72dyaffDK5qYZDkTFrTX+dbYLCohzyxdnGRy8hdfTB7RKZB2WTE9z4g9ikaTjMBCLJIXe6Le1+VTEFGfgNPZVRpeIresp+31B0w8gtj5DZXTJ5Le1XRXfpkPO5tbo77tuKsuriOr3GcbmtHXRs2oDsLfbYaLb1wCv2LcNv+++X6Jea/LP7ymGA1Fcn/zNwC8jjoB+X5DK6BIH359pHfiHQAegT97/Az0KuvrH/8uBAAAAAElFTkSuQmCC",0,12,16),sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAACIUlEQVRIic2WsW7TUBSGvxhLFZWFhF0Slig2QqJCitSFN+hURhj7AqyNxEwewFnhIcjYzW+QxWqGOiLFrrLQqGlVM1AGFIZyHfvm2r1GQeJfrJx79X/nnmPfk0a72V0ahyekkyHWqI9jtyjT4uoCAOPwRLl+PmgA7woxQ9ccwLFbOHaLdDJUrneOlsDHIkDXHCCMAgCsUb8UIuvBk5vTDzrmAN8uv/J05xnbDy1+nR3zfavJz8UpWzsvVxnbXW6/vAdeAWA6doswCtjb3V8zXFxdlJ7MsVsw6gOQViRl6piVSex3zj4BqxJ6rg9AnEwxAPZ295nNx5VmYRTQbnZrrXvucwxBrZNxHRmwer/FM28ox2oDPNdnNh9rlalMVVUoNFk886XQKYt4A8MoyBosZMBd10X2l+n5mkFZCVWgOOkRJ70iQEAAftymSiNRQh2IABUAeYgsUSZdSF6GKlhlIiBhFBBGQWGfqtlm/kec9Hj8+jOPXrwB4Dq3lk6GWbxzUDQJB43SE5hyQJjUUedoSToZcn38du0UGUBkr5Lu1QzrfSz0oCp7nZO1m93CK5oBNpW9StkJ/qb2tQD/Sv8HwPozGnUkN3rjJ5BvXzNOpniuTzxoKEeixd3VgfS1ynstBSxOpqsPzXN94qSn/HchJK70drOrPT4NQaqSbKZjLjwNOXCfPNevHJGytJs8m49L58VGALJ0h44WQDbLz/D79v4GmDn432rbZ9IAAAAASUVORK5CYII=",0,12,16)];
	
	global.spr_ultraicon = [sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAABKklEQVQ4jb2TvU6DUBiGHxrShBugMS5G17ZTOxQ3Aok34NSLMOFCano9km7QoUyUuElYGOQGTFhw0HNyDj39iRrf8eN7H76/A/+hIHW7IHW7X0OADvg5TECi1u+i1r8INjgHzbOCqPWJvYZTMNtQCbHXELU+eVYwnY3ldxUWe42leq0+AODhcQlAXZVc39xSV6U07Hdb8VMNZgWp2wmAqMJ+DjWzSfvdVoPJGamtnIMATOYLrVVt2NPZmNflFQBh4jBav2lmU0xoEHuNFaQuq+GG1XBDXZWEiSMThNEUU2XD1wbUWeVZcZBoih2A+np/ursopkqu/3twmjFMHLmAPCskTG1N+IytTeYLAF7uPxitzRX370m7zv5hnpKoXtyRdSTp7GvvP5E/0ye7naoPtCP3bAAAAABJRU5ErkJggg==",0,9,9),sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAA6ElEQVQ4jaWUPQ6DMAyFH4gzZOlSdWdkIHOGXqBTz8fUCzBkDgMjO2JhySXoUNImwa4s8aRIUX6+2M6TC0QyTm0QyGpfsJs7RDSoB4sAsdqjbloAwDQO5DxoGgcYp5LISkkqOaRuWljtk1KQoLppMY0DCcr3AqwEPsUzTpGXKWhI1Wr/XUuqn9cqTymGxOvGKVQSSAyIo4vPJr92fzyTy+sy43K9HaD9q4uzgNW+qA6nhDJOAfiZs+SikeiUjzixoHWZWS9RqnYPbb3ukl8IkHWZ5RFRhuRs8BfEwU5J0k7YNsLAWFGN7Q0laJJhX5rsJAAAAABJRU5ErkJggg==",0,9,9)]
	
	with(instances_matching(Player,"race",mod_current)) create();
	
#define vanthrohud 
	with(instances_matching(Player,"race",mod_current)){
		draw_set_projection(2,index);
		if index mod 2 = 0{
			draw_sprite(sprRogueAmmoHUD,rogueammo,view_xview_nonsync + 90 + ((instance_number(Player) + instance_number(Revive) == 1) * 16) ,view_yview_nonsync + 4);
		}else{
			draw_sprite_ext(sprRogueAmmoHUD,rogueammo,view_xview_nonsync + 4,view_yview_nonsync + 4,-1,1,0,c_white,1);
		}
		draw_reset_projection();
	}
#define race_name
return "Vanthro";

#define race_menu_button
	sprite_index = global.sprVanPortraitSmall;

#define race_swep
return wep_rogue_rifle

#define race_mapicon
return global.spr_mapicon;

#define race_text
return "Backup Call#Road Rage"

#define race_tb_text
return "Summoned Vans Last Longer"

#define race_portrait
return global.sprPortrait;
 
#define race_ultra_name
switch (argument0) {
	case 1: return "Rebellion!";
	case 2: return "Titanium Bumpers";
default: return "";
}

#define race_ultra_icon
	return global.spr_ultraicon[argument0-1];

#define race_ultra_button
	sprite_index = global.spr_ultrabutton[argument0-1];

#define race_ultra_text
switch (argument0) {
	case 1: return "More Vans Per Summon#Increased Strike Droprate for IDPD";
		/// Buff to active ability. Summon five vans instead of two
	case 2: return "Increased Hyper Damage#Increased Strike Droprate for IDPD";
		/// Buff to passive ability. Better control when running.
default: return "";
}

#define race_ultra_take
	//make sure you get the ultras
	global.Ultra[argument0] = 1;
	global.Ultra_Taken = 1;

#define instance_random
	var i = irandom(instance_number(argument0));
	with(argument0){
		i --;
		if i = 0 return self;
	}

#define cycle
    /// cycle(value, min, max)
	/// Thanks yal
    var result, delta;
    delta = (argument2 - argument1);
    result = (argument0 - argument1) mod delta;
    if (result < 0) result += delta;
    return result + argument1;
	
#define obj_create
	ID = instance_create(argument0,argument1,CustomObject);
	ID.type = argument2;
	with(ID){
		image_speed = 0.60;
		queuedestroy = 0;
		switch(type){
			case "_van_summon":
				summon_timer = 90;
				lastSummon = current_frame;
				on_step = script_ref_create(vanSummon_step);
			break;
			case "_van_ally":
				targ = -1;
				lifetime = 120;
				on_step = script_ref_create(vanAlly_step);
				on_draw = script_ref_create(vanAlly_draw);
			break;
		}
	}
	return ID;
	
#define vanSummon_step
	summon_timer -= current_time_scale;
	if summon_timer < 30 && summon_timer > 0{
		sprite_index = sprPopoPortal;
		//if (summon_timer mod (10 - (global.Ultra[1] * 2)) <= 0){
		if lastSummon < current_frame - (30 / (2 + (ultra_get(mod_current,1) * 3))){
			lastSummon = current_frame;
			with(obj_create(x,y,"_van_ally")){
				team = 2;
				aimDir = random(360);
				maxhyper = 30 * (4 + (3 * skill_get(5)))
				hyper = maxhyper;
			}
			sound_play(sndVanOpen);
		}
		
		if summon_timer - 1 <= 0 sprite_index = sprPopoPortalDisappear;
	}else{
		if random(7) < 6{
			with(instance_create(x+lengthdir_x(32 + random(4),random(360)),y+lengthdir_y(32+random(4),random(360)),IDPDPortalCharge)){
				motion_add(point_direction(x,y,other.x,other.y),2+random(1))
				alarm0 = point_distance(x,y,other.x,other.y)/speed+1
			}
		}
	}
	if sprite_index = sprPopoPortalDisappear && (image_index + image_speed >= image_number){
		queuedestroy = 1;
	}
	if queuedestroy = 1{
		instance_destroy();
	}
#define vanAlly_step
	//Frenzy time. Essentially a killtimer, while the lifetime variable is a "deletemetimer"
	if hyper > 0 hyper -= current_time_scale;
					
	//Flips the sprite
	if (((direction+270) mod 360)>180) image_xscale = 1 
		else image_xscale = -1;
	if abs(speed) < 0.20 speed = 0
		else speed *= 0.90;
					
	//Steers the character towards the nearest enemy, rather than automatically snapping the direction
	var diff = cycle(aimDir - direction, -180, 180);
	if (abs(diff) < 2){
		direction = aimDir;
	}else{
		direction += diff * 0.20;
	}
	//Behaviors
	if (hyper){
		//Hitting things
		if place_meeting(x+hspeed,y+vspeed,Wall){
			with(collision_circle(x+hspeed,y+vspeed,6,Wall,0,1)){
				instance_create(x,y,FloorExplo);
				instance_destroy();
			}
		}
		if place_meeting(x+hspeed,y+vspeed,hitme){
			with(collision_circle(x+hspeed,y+vspeed,6,hitme,0,1)){
				if (team != other.team && sprite_index != spr_hurt){
					my_health -= 6;
					sprite_index = spr_hurt;
					motion_add(point_direction(other.x,other.y,x,y),other.speed);
					other.hyper += 10;
					instance_create(other.x,other.y,HealFX);
					other.direction += 180 + (45 * other.image_xscale);
				}
			}
		}
		
		//Hyper effect
		if random(7) < 6{
			with(instance_create(x+lengthdir_x(32 + random(4),random(360)),y+lengthdir_y(32+random(4),random(360)),IDPDPortalCharge)){
				motion_add(point_direction(x,y,other.x,other.y),2+random(1))
				alarm0 = point_distance(x,y,other.x,other.y)/speed+1
			}
		}
		image_blend = make_color_rgb(0,255,255);
		draw_circle(x,y,8,0);
		sprite_index = global.sprVanChrg;//global.sprVanthroWalk;
		
		//Seek new target
		if !instance_exists(targ) targ = -1;
		if targ = -1{
			if instance_exists(enemy){
				targ = choose(instance_nearest(x,y,enemy),instance_nearest(x,y,enemy),instance_random(enemy),instance_nearest(x,y,enemy))
			}else{
				targ = instance_nearest(x,y,Player);
			}
		}else{
			if instance_exists(targ) aimDir = point_direction(x,y,targ.x,targ.y);
		}
		speed = 5;
	}else{
		image_blend = c_white;
		if sprite_index != global.sprVanHurtDead{
			sprite_index = global.sprVanHurtDead;
			image_index = 0;
			repeat(24){
				with(instance_create(x+lengthdir_x(16 + random(4),random(360)),y+lengthdir_y(16+random(4),random(360)),IDPDPortalCharge)){
					motion_add(point_direction(other.x,other.y,x,y),3+random(1))
					alarm0 = point_distance(x,y,other.x,other.y)/speed+1
				}
			}
		}
		if image_index + image_speed >= image_number{
			image_index = image_number-1;
			image_speed = 0;
		}
		if lifetime > 0 lifetime -= current_time_scale
			else queuedestroy = 1;
	}
	
	if queuedestroy = 1{
		with(instance_create(x,y,HealFX)){
			sprite_index = sprPopoPortalDisappear;
			depth = -4;
			speed = 0;
		}
		instance_destroy();
	}
#define vanAlly_draw
	if hyper > 0{
		draw_set_blend_mode(bm_add);
		draw_circle_color(x, y, sprite_width/2 + (sin(hyper)), merge_color(c_white, c_aqua, 0.4+random(0.2)), c_black, 0);
		draw_set_blend_mode(bm_normal);
	}
#define race_ttip
return ["SEE YOU NEXT LOOP!", "VROOM VROOM!", "BEEP BEEP!", " I AM BECOME THE BURGER KING AND QUEEN OF THE WASTELAND"];

#define create
	maxhealth = 8;
	maxspeed = 5;
	
	spr_sit1 = global.sprVanSit;
	spr_sit2 = global.sprVanSit2;
	canrogue = 1;
	
	hyper = 60;
	healthlock = maxhealth;
	rogueammo = 1;
	
	image_speed = 0.50;
	van_time = 0;
	van_summon_timer = 0;
	
	spr_idle = global.sprVanIdle;
	spr_walk = global.sprVanWalk;
	spr_hurt = global.sprVanHurtDead;
	spr_dead = global.sprVanHurtDead;
	spr_chrg = global.sprVanChrg;//Temporary
	
	snd_hurt = sndVanHurt;
	snd_dead = sndVanHurt;
	snd_lowh = sndMutant8LowH;
	snd_lowa = sndMutant8LowA;
	
	snd_wrld = sndVanPortal;
	
	snd_cptn = sndUseVan;
	snd_thrn = sndMutant8Valt;
	snd_valt = sndMutant8Valt;
	snd_chst = sndMutant8Valt;
	snd_spch = sndMutant8Valt;
	snd_idpd = sndMutant8Valt;

#define game_start
	global.Ultra[1] = 0;
	global.Ultra[2] = 0;
	global.Ultra_Taken = 0;
#define step
	if van_summon_timer > 0 sprite_index = spr_chrg;
	/// Local replacement for current_time
	van_time += current_time_scale;
	
	if (canrogue) && lsthealth > my_health{
		lsthealth = my_health;
		with(instance_create(x,y,PopoExplosion)){
			team = other.team;
			image_xscale = 0.5;
			image_yscale = 0.5;
		}
	}
	
	if instance_exists(GenCont) || instance_exists(Spiral) && GameCont.area != 0{
		hyper = 60;
		with(AmmoChest){
			if irandom(10) <= 1 instance_change(IDPDChest,false);
		}
		with(RadChest){
			instance_change(RogueChest,false);
		}
	}
	if collision_circle(x,y,16,RogueChest,0,1){
		with(collision_circle(x,y,12,RogueChest,0,1)){
			instance_create(x,y,RoguePickup);
			instance_destroy();
		}
	}
	if hyper > 0 hyper -= current_time_scale;
	if (hyper > 0 && !instance_exists(GenCont) && !instance_exists(mutbutton)){
		my_health = healthlock;
		speed = 8;
		
		if collision_circle(x,y,14,Wall,0,1){
			with(collision_circle(x,y,14,Wall,0,1)){
				instance_create(x,y,FloorExplo);
				instance_destroy();
			}
		}
		if collision_circle(x,y,16,hitme,0,1){
			with(collision_circle(x,y,16,hitme,0,1)){
				if team != other.team && sprite_index != spr_hurt{
					var vandmg = 6 + ((0.5 * GameCont.level) + (global.Ultra[2] * 5));
					if my_health - vandmg <= 0{
						other.hyper += min(maxhealth,30);
						my_health = 0;
						instance_create(other.x-12,other.y,HealFX);
						instance_create(other.x,other.y-4,HealFX);
						instance_create(other.x+12,other.y,HealFX);
					}else{
						my_health -= vandmg;
						other.hyper++;
						instance_create(other.x,other.y,HealFX);
					}
					sprite_index = spr_hurt;
					motion_add(point_direction(other.x,other.y,x,y),other.speed);
				}
			}
		}
	}else{
		healthlock = my_health;
	}
	hyper = clamp(hyper,0,60);
	if van_summon_timer > 0 van_summon_timer -= current_time_scale;
	if van_summon_timer = 45{
		sound_play_pitch(sndVanWarning,2);
	}
	//Special
	if button_pressed(index,"spec") && van_summon_timer <= 0 && rogueammo > 0{
		//Plays alert sound twice
		var floornearest = instance_nearest(x+160-random(320),y+120-random(240),Floor)
		obj_create(floornearest.x,floornearest.y,"_van_summon");
		van_summon_timer = 15;
		sound_play_pitch(sndVanWarning,1.85);
		rogueammo--;
	}
	/// IDPD Strike drops. Drop them upon death.
	/// IDPD Freaks are not IDPD, nor are they people. 
	with(LilHunter){
		if team != 3 team = 3;//Sets team to IDPD
		if my_health <= 0{
			repeat(3) instance_create(x,y,RoguePickup);
			instance_destroy();
		}
	}
	with(Grunt){
			if my_health <= 0 && random(10 - (global.Ultra_Taken * 2)) < 1 
				instance_create(x,y,RoguePickup);
	}
	with(Inspector){
			if my_health <= 0 && random(10 - (global.Ultra_Taken * 2)) < 1 
				instance_create(x,y,RoguePickup);
	}
	with(Shielder){
			if my_health <= 0 && random(10 - (global.Ultra_Taken * 2)) < 1 
				instance_create(x,y,RoguePickup);
	}
	with(EliteGrunt){
			if my_health <= 0 && random(4 - (global.Ultra_Taken)) < 1
				instance_create(x,y,RoguePickup);
	}
	with(EliteInspector){
			if my_health <= 0 && random(4 - (global.Ultra_Taken)) < 1
				instance_create(x,y,RoguePickup);
	}
	with(EliteShielder){
			if my_health <= 0 && random(4 - (global.Ultra_Taken)) < 1
				instance_create(x,y,RoguePickup);
	}
#define draw
	var xoffset = view_xview[index];
	var yoffset = view_yview[index];
	var ystart = 50;
	
	with(PlayerSit){
		spr_sit1 = other.spr_sit1;
		spr_sit2 = other.spr_sit2;
	}
	with(SitDown) visible = 0;
	
	draw_set_font(fntSmall);
	//draw_text_nt(xoffset + 4 + (index * 10), yoffset + ystart,"STRIKES[0]: " + string(rogueammo));
	if hyper > 0{
		if random(7) < 6{
			with(instance_create(x+lengthdir_x(32 + random(4),random(360)),y+lengthdir_y(32+random(4),random(360)),IDPDPortalCharge)){
				motion_add(point_direction(x,y,other.x,other.y),2+random(1))
				alarm0 = point_distance(x,y,other.x,other.y)/speed+1
			}
		}
		draw_set_blend_mode(bm_add);
		draw_circle_color(x, y, sprite_width/2 + (sin(hyper)), merge_color(c_white, c_aqua, 0.4+random(0.2)), c_black, 0);
		draw_set_blend_mode(bm_normal);
	}
	if hyper - 1 <= 0 && hyper > 0{
		repeat(24){
			with(instance_create(x+lengthdir_x(16 + random(4),random(360)),y+lengthdir_y(16+random(4),random(360)),IDPDPortalCharge)){
				motion_add(point_direction(other.x,other.y,x,y),3+random(1))
				alarm0 = point_distance(x,y,other.x,other.y)/speed+1
			}
		}
		hyper = 0;
	}