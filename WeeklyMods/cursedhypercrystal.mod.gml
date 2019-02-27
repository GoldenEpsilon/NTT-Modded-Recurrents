#define init
	global.DEBUG = false;
	global.crystalexists = 1;
	
	global.sprCursedCrystalHurtDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAACKAAAABgCAYAAAAg5JjcAAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAAgAElEQVR42u3dT4tbV5oH4Ff5Dgk0gc4mi4HgzmbAm9gwVLYhk1Rv7f4Kdi+aogYqpMCFmUXKX2GcbZRMyDbVAx5vDNnEhWEW3iQQAvZ3iGZhH/no1r3SlXT/Sfd5NonLZVv1O0fnHul9de5kNpsFAAAAAAAAAABsaqIBBQAAAAAAAACAbWhAAQAAAAAAAABgKxpQAAAAAAAAAADYigYUAAAAAAAAAAC2ogEFAAAAAAAAAICt7HIDyiwiJoawp4kzmcxms5n85S9/5C9/AAAAAAAA0IDChhNHAVL+8pe//OUPAAAAAAAAr+1qA0r+oBXBup40k8nsm6+exl///pdQhJS//JG//AEAAAAAAEADCutPmleffo/JZKIAKX/5I3/50/0eSPb9PgfkDwAAAAAAJXaxAaXsASsEdDVhXn/6/fDutTg9vIgvvv1YEVL+8kf+8tcU0e0+SNY9Pg+sOwAAAAAAUE4DCutNmNeffo8IBWD5y1/+8pe/BpT+9kCTwtfl38FzYB64tQcAAAAAAK7YtQaUZQ9WIaDtyZJ9+n16fhnPHr+IiFAElr/85S9/+WuA6H4fJO8engfzgbDuAAAAAADAFRpQqD9Zsk+/KwDLX/7yl7/8X+fvOtzfHkjmHT4HrgyItQcAAAAAABbsUgNKnQeqENDWRMk+/R7x6vYLH3z0jiKw/OUvf/mPPP+T6YFrcH/7IKfPdPg8uDIg1h0AAAAAAFigAYV6E6Xk0+8KwPKXv/zlL//XDSjy73cPJP+WnwOVA2PtAQAAAACAObfgof5keV2EnJ5fzr/27PELxV/5y1/+8h9p/k4/GcT+R/4dzP/KgbH+AAAAAADA3K41oERUH0FPFxPGEfTyl7/85S//N/m7Dvez77EP6nHeW4cAAAAAAKDcLjagAADDkDYRCvDtZ7x0PyemljbKGlAAAAAAAKA2J6Cw3oRxAoH85S9/+cs/Fk4/cR3uZ+8j+x7XHmsQAAAAAABctWsNKAowfU6WyWT25ec/xgcfvTP/2rPHL+KLbz9WgJG//JH/yPI/vHvNNdj+ZzTzv3JgrD8AAAAAADC3Sw0ojqDvc6Jkxcdnj1/Mv55+rQgsf/nLX/7jyv9kerDq+jtzXe51/yP/hub/ygGy/gAAAAAAQETsTgPKOg9SEaDpSTKZzL756mkc3r0W0/PLK7+fvv7Xv/9FEUb+8kf+I8i/cPpJTCaTsvw1QNj/7Pz8rz1Q1h8AAAAAANCAQo1AswJkmdPDi/jgo3cUgOUvf/nLf2T5Z99XzH/mmmz/sw/zv/ZAWX8AAAAAAGAnGlA2eYCKAE1NkJLiY/4p+OLtMBSB5S9/+ct///PPv1bRBOT0k373P/JvYP6vPWDWHwAAAAAARk4DCsuDVACWv/zlL3/5Z/kXT0MpaUBx+kn/+x8NKA3M/7UHzPoDAAAAAMDIDb0BZZsHpwiw7eSouPVCVQE4QhFY/vKXf3P5l12f5N9//mUNKIX8V12HNUe0u/+xB2pg/m88cNYfAAAAAABGTAMK1QFuUIA/mR7EZDJRgJG//JH/nuZf1YCS5b/sGqz5pP39jz1QA/N/44Gz/gAAAAAAMGJDbkBp4oEpAmwaXEXxMWKxABzxpgh8Mj0ouxUD8t+r/IvjIH/5jzH/3OnhxTz/k+nBsuuvW/P0u/9JzT+agFbM/60H0PoDAAAAAMBIaUChPLgapw8kboPRT/41boMh/xbyryrKy1/+8o9lDSiaT+x/dmb+bz2A1h8AAAAAAEZqqA0oTT4oRYB1A1vj9I2Iqw0oEW6FIX/5y1/+Y8s/az4p5j9zTe59/+PUk5rzv7GBtP4AAAAAADBCGlC4GliNAuSzxy/ig4/emf9/7mR6ENPzS6cQyF/+8pf/iPJPDSgl+Tv9pN/9j+aTNeZ/YwNp/QEAAAAAYISG2IDSxgNSBKgb1JLiY0S9T8C7FYb85S9/+cv/df6uw/3uf2S/xvxvfECtPwAAAAAAjIwGFBaDqnn7hVR0rPoU/OnhhQKw/OUvf/mPOP/C32Mc+tn/yH6N+d/4gFp/AAAAAAAYmaE1oLT5YBQBVgW0waffE6cQyF/+8h9S/m7F03/+rr/2P7s0/1sbWOsPAAAAAAAjogGFNwHVLEDmxcayT8BHOIVA/vKXv/zHnP+a19+Za3Wv+59Z9j2zMY6BBhQAAAAAAGjGkBpQunggigBVwawoPkZsVgBO36MILH/5y7+L/FPzg/zbzT+dMFOVf/7nSvKfuT73tv+Zyf3q/G99gK0/AAAAAACMhAYUXgXTYAH4+csnERHx8NGxUwjkL3/5d5r/yfQgbt88k3/L+Zc1oJScfOKaPJz9j+yXzP/WB9j6AwAAAADASAylAaXLB6EIUAxkw+JvkorA33/3w/xr7799fV4Ijoj49LNPFIHlL3/5N5p/aniYnl/G99/9EA8fHUfEq9NP5N9e/vkpM2n+L/vzrsH2P0Oe/50NtPUHAAAAAIAR0IBCYwX4YnEyFX8jFIDlL3/5N59/fgrHqgaIyWQi/y3yP7x7bX5bo2IDyqrsK27Dw7D2P7Mx7o80oIxrnI0BAAAAAED7htCA4uj5PidAjeJjRL0CfPo78sJ7ThFe/vKXf1P556efrPrzt2+eyX/L/IsNKMVmlKrca87/UTY/2P/0P/87H3DrT2/rnPW//+ea/AEAAABgHDSgjH0CNFiAz29BUkYBuJ38y07ckL/89z3/1ARR1QBRHA/5b5d/akDJTz/J539V7ivyn438mtz3/mc24uw1oIxsnbP+95f/l5//GF98+7H8AQAAAGAk+m5A6fMfH/2boHWLjxHNNKBEKAI3nX9+CxL5y38s+dc9dUP+zeVf1oCSn0KzwfzXfNLv/kfzSV8Db/2pHI+ms0nrXERY+3u+1sh//55fAAAAAFBFA8qYB7+B0x8Sp6B0n39+Gwz5y3/f8y82QESE/DvOv46aDUCuw/3uf0a/B9KAMrzxaOOUjPT3fvDRO9b+Gs8HDUCeWwAAAADQhD4bUGZD+PlHO/ANnX6SOAWl2/zz5gf5y38M+Re/V/795r+O1JTy8NGx66/9zyDmf+8TQCG4dE2KaK5RYTKZzGaz2fxaoQC/PCsNQPv93JI/AAAAAF3SgDLWgdeAsrP5F5sf5C//MeSff6/8+81/lbJTUPLmk8lkMvZCmP1Pz/O/9wmgEHxlTFKjQkQzTSjp70ynZll3Vl8Tmsq+OAYRGoD2aVwBAAAAYJW+GlBmQ8pgdIO+RvExovkGlIePjmN6fjnaN0Plv7v5lzWfyF/+Y8i/7Pvr3AKpcOrJ/O8ccTHM/qfn+T+YiaAYvDAu6fXI9Pwynj1+sVXDQt7Q8v13P8TX//sf8q6ZV0Tzp9C8/n9j0OO4akABAAAAoEsaUEbcgBIRtT8Bv6z5IUlv9FdJhchU0Bx7AVj+u5d/+iR1VROE/OW/r/mn7Iv5p69Pzy+v5F/VfDLm/O1/+p//g5kIisEL4zKbzWJ6frmwLm3atJDWudMHd+LD9w40oNTMP1/ztz2xRBPQMMbVCTQAAAAA9MEteMY68FkRMqK6EFnn9I2k6lPwxcJvhKOg5b+7+Vc1Qchf/vucf96AkuefN6Dk+RebT+Rv/zOk+d/7BFAIvjImqQElt8lakTc+nD64E09//ae8a+R1Mj1orAEo/3unP51pAipZf7rIwgk0AAAAAPRFA8pYB/51ATIVdlPxtliI3KYBolj4TV//9LNPFIDlv/P5F28HI3/573P+xRNQir9e9XfI3/5nSPO/9wmgELwwHnkDRG7TBhSnn/SXf/53agKqzuaLbz9udS1wAg0AAAAAfeqzASWi3yKMT+EVipARVwuRmzRAFP9sfiLB+29fdwy0/Pcm/7wJQv7y3+f86zSg5M0n8rf/Gfr8723gzf8rY9FUA4Sie7/5G4f619484zbWBSfQAAAAANAnDShjHvySAmRS9Wn2OoqFx59/eXNKweG/HitAyl/+8pe//MfO/qfn+d/bwJv/V8Yib4B49vjFfA3apAHlm6+eanrYIv/cNg0o6RQap59czSZ/7Z3mfJMnojiBBgAAAIC+9d2AEtFPEcabcCmIJUXIiJh/ejEvIlb58L2DeP/t6/H85ZOFr6c/q/go/33L/+dfLuLD9w7kL//R5F81Frdvnsnf/mfn5n/nA27+l47Dl5//GBFvTrVKDSipMD+bzSb5eJXlmBfd3eZr/fyL2Udsfgskp5/Uy3t6frnQ6DmZTBpvQDEGw77+GBcAAABgX2lAGfsEqFmAjIilTRCpCPz+29dj+tNZ6e+7/YL89y3/1AAhf/mPKf+qtej08EL+9j87Nf87H3Dzv3Qcvvz8x3j+8kk8fHS80ARxePfavCifr1dla8mqBhWW5192S7u8AaVuvk6hqZ93UyfOVI2B00+GPQfsiQAAAIB9NoQGlIhuizDe6CkGsuJWDNs0QORf90ab/OUv/ybzX9WAIv/28696Lsjf/mdX5n9nA23+V45BsQHlZPpq7bh982yhiUGTSTv537pxb559WvsjrjagLGsAysfSKTSr53tbDShOP9mN8fccAQAAAPadBhQaL8Dnt2Bw+wX5y1/+beVf1oAi/6XX1Ukb+Rd/7/bNM/m/GYNJ9l/7nwGuP51NBut/5RikBpRPP/skDu9eW1jXFdDbzz9vQEnNP69/byH7OrdBMt/rzfeIuNKE0lQDihNodmPP63UBAAAAsM+G0oAS0U0Rxps8VcHUKEKuKsBX3f5C8V3+8pf/pvmfTA/i9s2zlQ0o8t/++po+/b5J/g8fHZc+L+RfORaT0HwymPWn9UE3/2tfA9I6rgGlu+xv3bin+afDvPMGlPyWUxHbNaE4XaN6bR9CFsYHAAAAGBMNKLwKRgFe/vKX/4DyT5/Cnp5fLs3/518u4vbNM/m3dK1dN//i950eXsi/vz2P/U/N9af1wTb/V45BfgrK6YM782vrsiYIJ240e/3V/NPtfE8NKGmvGVHdgFJnrns+lOecGj76zGYymcxms9l8vO2LAAAAgH03pAaUiHYLMt7kWRVQRRF+1W0Y8ttfFAvAir/y37X8D+9ei4hYKArIv/v80xjUuQ1MVQOK/Le75m6Tf+F75d/f3kf+Ndef1gbX+lN7DNJJHHUaUNzKor/sy5438l8v72IDStpvLmtAMd8321fmUn5dztl8vF//2vgBAAAAe08DCm8C0gDRe/75p+Pk30/+iQaU3cn/4aPjOD28kH+D198m8teEYv+zS+tPawNr/ak9BsVTUKqaINL1Ynp+GRHhdhYNZL9uA4qGiGbmerp+1mlO0PCz3b6y8HudZJjGevrTWZzceRDff/eDk4UAOtrXW2sBAKDnvfnAGlAi2inCeOGxxou1ZU0oVQVIxffm8l/WhCJ/+cv/av4PHx3PG4HkP8j8Z67F9j+7MP8bH1Drz9pjkG6ZUdWAkn9POjHLiQLb537rxr2IiJXNP/m1QgPQ9nM9NaF8+N6BWx+1lHHEq9s6pvna1Zyts54B49hXet53m/mtG/estwAAMIQ9ugYUii/a1jkFxekP8pe//OUv/5r5z1yP7X+GPP8bH1Drz9pjkArG+bqTFxHy0zrKfp/tsl9VLNcA1E7e+TXVfG4+52IDSkS7TSiaT8Dak/YzXo92t4dP+0OnswEAwED26gNsQIlotgjjRccGL+CKRch1C5CKv/KXv/zlL3+JDm7/owloxfxvbCDN/43HIBVuNaB0n3txzS87gUb+zV1rU4b5yTN1M/Xp+vXmdVenoGg+AevON189ffWa6O41TZod7NvTe9rT80vNJwAAMKQ9uwYUql40K0DKX/7yl7/85W//M6b539hAmv8bj0GxEaLYgJI3qCjsNp+9BpTu8i7e+ihdW1dlml+rXW/rrScn04P5LQY/+OidiKjfhFK32afOcwjY/3Unvcd6enhhje5o3xLxquFH5v28bpI3AACle8aBNqBENFOEsQne4sXEsiJkTvFR/vKXv/zlL3/7n32Z/1sPoPm/9RgsazLJT49Q3G0+93zNL8teA1BzeacGlIj6p6Ck4mY6zaPNW8ns07x+/vJJPHx0PG9Ciah/a4w6DT/5c+Ovf/+L6wGD29OYi8PYw9Be3poy+9nHvP/29fji24+tM9Z6AICr+xQNKFRtYKsKkMVPwCtAyn+s+af/T8UC+feTf/58kL/894D9T8/zf+sBNP8bGYe8mFtsgpB3+7lXFc40ADWb9zqnoOTjc3j3WvqaMagxpyMWT0FJv66b36rijuKPPIY4BprVhnkdxXqzr+8beB+g3zVHExYAMLi9yoAbUCK2K8LYcDX8YqLOJ+AVH+U/hvwfPjqOiIjbN8/kP6D8f/7lQiFG/vvC/qfn+b/xwJn/ja9Dimbd517V/FP2/DA22+ddbEKpOgXFLZC2m9PPXz6JTz/7ZN68c/vmmQw7WkesGf3lf3j3WkzPLxUme9i/DLUBJV3HzQWa2sOka6tbIPWz1p9MD+bNhtZ6AGBQ+xUNKKx64VxWgPz5l4v5m6MK8N3lf3j3Wty+eSb/HvNP0pvW8pf/GPNPTg8v5G//s5fzf+OBM/9bGQu59nMN0PzTXd7pGPv89ZYGlObyzT8dnBpR8sZ+ObazhuSGVhTb1+tL8QSO/PYYrqfdjsFQXxcN/fGxe/M9P20pwolLfaz3+cl41noAYDD7lYE3oERsVoSx0WpwQ5uKkKtO4FB8bC//ssK7/OUvf/l3nX8Zt96x/9nX+b/2gJn/7OFzwLzuLu90q5iqWze4tUMz+T5/+SQiFm97FBHx9Nd/yrPBvKveZxrCaXn7WoAvWyOs466hZY8tNT16/UZT631+0pJ1x3oPABChAYUam9plt4Fx+kA3L+YiXp00IH/5y1/+feRf8/vlb/+zV/N/7QEz/4EG1p1lTSZDv7XD0PNNt+JJ8iaUD987qJ1pfo0wBtVZR8TCrQEi+v9k/KrbjO3T3mVIP5vbtw1rnty6cS8ePjr2+o1G11Xvx3T/PNZ4AgAMes+yAw0oEesVYWy6WtjYVp2C4vQB+ctf/vIfT/6rTkNxDe51/yP/FuZ/7YGy/nQ+LjJn3+d42W2QFHG3z3bbJpR8b2T/uTrrYgNKRL9NKGMfv76ap4q3whpz9sWfu+sxyU+sGMutUnahaXCXGxvtzWVuHIwDAJReK3ekASWiXhHGBb/lTVX6xF2S31PYhkv+8kf+48j/4aNj1+Ph7H3k3/LcrzVQ1qBWsi8r0pQV5el/bJD1ruV668a9+dc+/eyTiIg4fXBnaRNKXriNCGvRipyHdgrKPp9+suxnLjtFKf/52yh8l61f6RP7n372SRzevTaq0zdS7mXzv4+9zVj2U/nJYhExyManXXiMQPWewnMWAJZcL3eoAWX+mrjs5zCU3b44WhgQGy35yx/5jzn/qo2EsWl+v7PWkImw2fm+csCsR43mX3X6gwaU7ua/BiDGMM9v3bgX7799PSJe3W42Iipvf5SaF9KJcG5fsTzfvAHl9PBiIeOu15HUPJQexxgKRsW1PG+CyBtA2ljbl13Hx9jElfI4vHstTg8vFuZfG82Gdf7OfW5yzH623teeOuvS9PzSrfVgB/c4aU9oPwgAFdfMHWxAAQCGRyNKN3ku3dcV/pzsN90ga0DpPf/iJ8ry2zl4k6/9/DUAMbb1PjVLRJQXKvPTG9KJcIqF9dby5y+fxMNHx/NCcES3DSD59eP1r0fRfFJ20kl6/+/2zbP5/O26AWIstxLLMyg2GrS9foz9el1stuoq920eo70t7O4a4/kLABXXzB1rQFn2YF3oO3oBXTowNlrylz/yl3/19doYNb/vqbMPmsm+nXlvHeou/+Int31CtJvsNQBhzV9c3zWgbL6WRCyegpJ+velass4tY9JjmP50Fid3HozqGlJ2HU2f2HYtbT/7sgagPP90O9k2xmDst3ArFofTqTNlmbRxC6p154jXErCb+5t0i0HXVACouGbuSAPKtgUYGnjxmn8qrKjqxRzylz/yH33+TuTof/+jEWWL+V9roKw/nYyH+2x3P/81AMHiGqR4v1luz18+iU8/+2R++6LbN88iYv0mnrQWPXv8YuX1IB+z0wd34sP3DkY9bk3O4bGcYtLkdbQ4BnXmMM3t46tybusWVKueF2NvEoJ9WWPSmu6ESAAouV7uQAPKpkfQ09CGKr3BExHx/OWTK9+T3zPbhkv+8pe//OW/4npujJrfB8m0xefBygGy7nQ+FjLvJ38NQHgeaMTadO1IBffUiJJOkYmo34SS38YkIpbuPTWfLM9kmzmcny6xqolCo4r9zK6MR9O3oHLLQnOdcc3zWzfu2RsOYK2x3gAMbI3WgMI6by5ELBYh8+KjT3DIX/7yl7/8JdfLPkjuHb2ZUTpA5j0jey6Y8/2PgzEYxjXBONTPLZ2ml/aSn372SZw+uDP/nqe//rP2aSbpFJWqW/hoPlmd4aa3/Sg2AUWUNwJla1WcHl74sMAA9q+yl3/XGaTb1nX9XkGd/O2nzP993aOPKf/iKTRDeF9y3/Mf+vtjY5n/Q31vRv7yL31cbsFDncmbipBVFB/lL3/5y1/+EutlHyT3Hl9km/dA19dkRVx2df6mW/EkeRPKqiaRvJiZTk8p+/7iKR9V32dPc/XWMKv2NmkM3n/7epxMD9LXKscgIuJkelDrxBo235cuyz81bE3PL+Uv/85zqtuAsk7hvqn88z2V13Tmv/x3dh8zb3Lt4nRC+S++R3x491qcHl4s/H6b7w3Lv3wMJpNJJ9cx+b/5OY/+9u6rX/zpVty/f38w+f/j3179/1t/fjfiT7cifv867v/Xb/03RmpAoe7CVnZk7vtvX4/pT2dx+K/HCpDyl7/85S9/ut8Hyb3jN3qWbfoB2r4mexOfXZ7Dmzah1GlAKTvhw7W6/toS8eaN7FUny6TXBsvGIBWDjMN6+8xVJwEVT6jMX4cV83/46FgDkPx7yfTWjXvzNX5ZA0pf+ae/awwNEssafMx/68+u7iU/+Oid+b7l9PBio/ck5b/dvjGtn+lnXHevJ/9m9u2pCWjd54D8N88/b0D548mrBpT//J9253/6N//49bcr/15qPnnrz+/GH09+i7f+/Sji968jIjSgrMkR9ANY3J49fjFfTBQf5S9/+ctf/vLvdR8k957eHFr3xTXAtmvQl5//GCfTg8riMOzS9TQVJyNeFSgjYuntcsoaG6puqeAavf7akj6puKyIU2xMXzUGxqH+66zDu9fi9s2ziIiVTVgRrz4IUHY7qlVH4xsP+XeVa53TT/rOP/37XZyc0Odr13RyVXEc+szftUL+Te5dNnltJP9m5u6mp2/Iv5n881tirnM6ufy3y//ob29OGEn++PW32k0o+d/xx3+/bmD5v+pG0X/8y+tf/Ck73SQi7t+/vxP5a0BhrcVNAVL+8pe//OUv/8Hsg+Te4fNg2SYeoOn1pqxIsI9FEsY9z1NhLCLmn2Zd1mDiedD8OKTmtlXH2Ocn2Mi/uddYSfGTxFXNPfltkPLCgxMG5D+UXIt1hqpbdfWdf/FUp314XyPllJ82lpo885+xz/zTHEmf2k+nlu1rA1DZ+wbybzbjdZth5d/O61X597O+rCL/4eU/P0ElYqGRpey0kvTv/eNf4lUDyvWjhcaXdU44mUwms6Ojo/mpLW/9+d1OTkjZpQaUCEfQD+YF2vff/RA//3Kh+Ch/+ctf/vKXfz/7ILkP6E0OgKavufmbMalI4rrLvl5b0z3DI940opTdMmFhU+S50OjeJr9ve1kTin1Qe6+vIhaPUV/W5JMVfeYFgH0pnreRcVUm8u9mXlcVloaSf34N2pcGlOIn49MHiL749uP5+t1X/sVbR0zPLxce3z48h/IxqLo1hvzlL3/5y38/85+fbFJxa56yBpT0vfH78pNQIiKOjt40oGx06srrfzN+/zr+ePJbxJ/Wv33Q2rloQGGTFxKpALnsPs3IX/7IX/60tg+Sew/Pg/lAmPdAi2tNsRBi/WFM19jKTZC53/kY5Mc6y7+fOV+Vv9P56uW7rAFF/u3P613Jf1/WuWKBL91Wrfiz9ZX/vt+mqlj8TQ21EXGlsVz+8pe//OW/X/nnzSdv/flNk0l+ysgY89+1BpQIR9APYjF79vhFRIQuf/nLX/7ylz/d74Pk3uPzwLwHulhr2n4jAOOya/tPe0/5y1/+6+S27bHu8jf/d3mvMn/zYMPc5L/VPjFu3zybf32TT/jLX/7yl7/8dy//o6Oj+OO/77/5jQ1OGEnNLOuccDLobDSgsMkG9PTBHZ9+l7/85S9/+cu/n32Q3Ht8Hpj3APu9zkdU3y97F+/Tvg/ZzzdBsu9lTOQv/31ZT+Rv/iP/rrPbJEP5y1/+8pe//Pch/11sQIlwBH3vTyT3IJe//OUvf/lLBADYt71OWaOJBpT+si9+T/p/49B8/rKVv/zlL3/5S0T+8kf+8kf+jfyMGlDY5Ilx68Y9n36Xv/zlL3/5AwDs1V6n2GybvnYyPYjJZGIP1HH++e9989XTiAiNQC3knrJddty2N6nlL3/51820blbybyf7uhnJX/7yl7/85S//fvI/+tu7ERFLb7ez6/nvagNKhCPoe39CWXDkL3/kL38AgH3b60TEQgPKN189je+/+0ETbg/552NwePeaJqAWM88V83/9tTg9vHAaovzlL/+lea5zYpj85S9/+ctf/vKX/z7kf/S3d+P+f/3WaP5HR0fxx5P7lQ0qg89FAwqbPqEsOPKXP/KXPwDAvu993IKw//yfv3yiAajn/B8+Oo7p+aUTaOQvf/kvzSyimSKJ/DfPP9kmK/nLX/7yl7/85d9P/v/4t4j4PeKtfz+K+P3r2o0tg8tlhxtQAAAAAFrj2GH5y/8qYyF/+SN/+SN/+SN/+SP/yp9FAwoAAAAAAAAAANvQgAIAAAAAAAAAwFY0oAAAAAAAAAAAsBUNKLT+7rgAAAAbSURBVAAAAAAAAAAAbEUDCgAAAAAAAAAAW/l/G8y0IC12yW0AAAAASUVORK5CYII=", 23, 48, 64)
	
	global.sprCursedCrystalIdle = sprite_add_base64("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", 6, 48, 64)
	
#define instance_random
	var list = ds_list_create();
	var obj;
	with(argument0) ds_list_add(list,id);
	obj = ds_list_find_value(list,irandom(ds_list_size(list)-1))
	ds_list_destroy(list);
	return obj;
	
#define chat_command
	if argument0 = "toggledebug_chc"{
		global.DEBUG = !global.DEBUG;
		trace("DEBUG SPAWN",global.DEBUG ? "ENABLED! PRESS B TO SPAWN!" : "DISABLED!");
		return true;
	}
#define step
	if global.crystalexists = 1 && !instance_exists(HyperCrystal){
		with(LaserCrystal){
			explode = 1;
			alarm4 = 30+irandom(60);
		}
		with(InvLaserCrystal){
			explode = 1;
			alarm4 = 30+irandom(60);
		}
		global.crystalexists = 0;
	}
	if instance_exists(HyperCrystal){
		with(HyperCrystal){
			if ("processed" not in self){
				global.crystalexists = 1;
				image_alpha = 0;
				if GameCont.area = 104 || global.DEBUG = true{
					cursed = 1;//Do area check here
					maxhealth *= 1.33;//Additional boss loop health upgrade
					round(my_health);
					my_health = maxhealth;
					spr_idle = global.sprCursedCrystalIdle;
					spr_walk = global.sprCursedCrystalIdle;
					spr_hurt = global.sprCursedCrystalHurtDead;
					spr_dead = global.sprCursedCrystalHurtDead;
					sprite_index = spr_idle;
					
				}else{
					cursed = 0;
				}
				telesize = 1;
				teleport_timer = 30 * 16;//12 seconds
				teleport_phase = 0;
				laser_timer = 30// * 8;//8 seconds
				laser_phase = 0;
				laser_charge = 0;
				laser_burst = 5;//repeat 5 times
				teleport_x = x;
				teleport_y = y;
				processed = 1;
				canfly = 1;
				script_bind_draw(crystal_draw, -2);
			}
			if (cursed){
				if random(10) < 1{
					with(instance_create(x+(sprite_get_width(sprite_index)-random(sprite_get_width(sprite_index)*2))/3,y-8+sprite_get_height(sprite_index)/2-random(sprite_get_height(sprite_index)),PortalL)){
						depth = other.depth + choose(1,-1);
						image_blend = c_aqua;
					}
				}
				
				if laser_phase = 1{
					image_blend = merge_color(c_white,c_fuchsia,laser_charge*0.10);
					if laser_charge < 100{
						laser_charge ++;
					}else{
						laser_phase = 2;
					}
				}else if laser_phase = 2{
					laser_charge -= 2;
					fastspin = 2;
					wantdist = 20;
					with(LaserCrystal){
						if distance_to_object(other.id) <= other.dist && alarm1 <= 0{
							alarm1 = 4+irandom(8);
						}
					}
					if laser_charge <= 0{
						laser_charge = 0;
						laser_phase = 0;
						laser_timer = 30 * (2 + irandom(8))
					}
				}
				if teleport_timer > 0{
					if teleport_phase = 0{
						teleport_timer --;
						if laser_timer > 0 && laser_phase = 0 laser_timer --;
						if laser_timer <= 0 && laser_phase = 0{
							laser_phase = 1;
						}
					}
				}else{
					if teleport_phase = 0{
						var FloorTarg = instance_random(Floor);
						teleport_x = FloorTarg.x + 16;
						teleport_y = FloorTarg.y + 16;
						teleport_phase = 1;
						sound_play_pitch(sndHyperCrystalHalfHP,0.8+random(0.4));
						mask_index = mskNone;
					}
				}
				if teleport_timer <= 0{
					alarm1 ++;
					speed = 0;
				}
				if teleport_phase = 1{
					telesize -= 0.01;
					wantdist = 20;
					fastspin = 2;
					if telesize <= 0{
						crystals = 0;
						sound_play(sndHyperCrystalRelease);
						with(Wall){
							if distance_to_point(other.teleport_x,other.teleport_y) < 32{
							instance_create(x,y,FloorExplo);
							instance_destroy();
							}
						}
						x = teleport_x;
						y = teleport_y;
						telesize = 0;
						teleport_phase = 2;
						alarm1 = 1;
					}
				}
				if teleport_phase = 2{
					telesize += 0.02;
					wantdist = 20;
					fastspin = 2;
					if telesize >= 1{
						telesize = 1;
						teleport_phase = 0;
						teleport_timer = 30 * (8 + irandom(12));
						mask_index = mskHyperCrystal;
						sound_play(sndHyperCrystalSpawn)
						sound_pitch(sndHyperCrystalHalfHP,1);
						fastspin = 0;
					}
				}
			}
		}
	}
	if instance_exists(Player){
		with(Player){
			if button_pressed(index,"horn") && global.DEBUG = true{
				instance_create(mouse_x,mouse_y,HyperCrystal);
			}
		}
	}

#define crystal_draw
	with(HyperCrystal){
		if ("processed" in self){
			draw_sprite_part_ext(sprite_index,image_index,0,0,sprite_get_width(sprite_index),sprite_get_height(sprite_index) * telesize, x-(sprite_get_width(sprite_index)/2)+(2-random(4)*teleport_phase), y-sprite_get_height(sprite_index)*0.66, 1, 1, c_white, 1);
			if teleport_phase > 0{
				var drawsize;
				if teleport_phase = 1 drawsize = sprite_get_height(sprite_index) * (1-telesize)
					else drawsize = sprite_get_height(sprite_index);
				draw_sprite_part_ext(sprite_index,image_index,0,0,sprite_get_width(sprite_index),drawsize, teleport_x-(sprite_get_width(sprite_index)/2)+(2-random(4)*teleport_phase), teleport_y-sprite_get_height(sprite_index)*0.66, 1, 1, c_white, (1-telesize)*0.5);
			}
		}
	}