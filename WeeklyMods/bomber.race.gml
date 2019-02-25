#define init
	global.sprite = {
		select : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAIAAAB8wupbAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACuSURBVDhPtZHLDcIwEESXM0XkSgscuFMGSgNUQRl0QQvc0xHYGWuZjDcbIcFoLpbf89cu9l3jCMS16fnom2gL4X4bUQxDxxxyjts72Q6oOPEd2FHBV03KTrxDX3f+LNTIxFoBX8/HXwv8UIU+HYaNZ8XCSBPyuKbo/rUrbYM5vgkEpGpARWC6nKTedaYXAtASQTeOLihoCO2nea6v0JkAFDQ7geAo9yPIxFqbYPYGF6GlqyVtWIoAAAAASUVORK5CYII=",0,0,0),
		map : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAACXBIWXMAAAsSAAALEgHS3X78AAABjklEQVQ4ja2Uv2vCQBTHv9EiGQLdXRQX59opdOp20LF0cdQ/IJsUCpUWBOnmH5COLiWjkEkHsdJB7WgoiFlci9BBWsLrYO7M5Zcp9AtH7t2798k395IA/ywlwx76S01akgDA7DRwfnmN2cgCADTvnlNrk4DEQQAwG1lizmMfHKmPA1LYVRB2DBoG0n3zAqVKNcG4LHfl4NGcSJyTIAwASpUqXm776L5ZGZAWgIm0woHEPBV2fgd35eCmW8cMx4HuyknMEfNUwv78yHd7dAT2CuXi6O+vAynWSIFGStqe8Lu6d2gwXTjlVwCkkUIaKbEuDaZLLoNNgTNYAAAMpsPBQqx/KbIBg+liPl9vpBx/DmKeGnaN6tVZZC0ONF66gpULw7btArbtgnAcdsDjWrmIWrkYuZHUlHVdwefHjwC3/MKggvF8vZHcRYBcHPoUl4zC4h22AJT7h8M/ffhOBPXsKcZLF2anEcmLpgz9cwy6svM7AIeu9uwpAAhQ0h+Hi4aeSswfyPa1JDoU0JRcJv0CZDDITtlIeOQAAAAASUVORK5CYII=",0,10,10),
		portrait: sprite_add_base64("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",0,36,236),
		button : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAIAAAB8wupbAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACuSURBVDhPtZHLDcIwEESXM0XkSgscuFMGSgNUQRl0QQvc0xHYGWuZjDcbIcFoLpbf89cu9l3jCMS16fnom2gL4X4bUQxDxxxyjts72Q6oOPEd2FHBV03KTrxDX3f+LNTIxFoBX8/HXwv8UIU+HYaNZ8XCSBPyuKbo/rUrbYM5vgkEpGpARWC6nKTedaYXAtASQTeOLihoCO2nea6v0JkAFDQ7geAo9yPIxFqbYPYGF6GlqyVtWIoAAAAASUVORK5CYII=",0,0,0),
		idle : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAYCAYAAAAF6fiUAAABvElEQVR4nO1XMU4DQQzcn9BSpqVAQkpDyRMQJQ0VPU0ekYJfpKaj5xO8I+iQHJmJd9fetW+RNsVUSWY8M3ZySXdvKV0wDsMHmB3DB5gdwweYHcMHmB36N6Z0lDDawH9Baz5q8q/Pwy/ed09/4FFCbnjPkqO5KR/MqKahIn993J4IuRChxwjxS+V6lZwCFwjzkTIqaajJcw33GCF+ScOr5MgFyuVjKTp7qhhQyYS1gMS+AtCA5xWsuUClKzAX8HJ/cwpIIuUB7r8fjs8fG3MBpIEGsFwrf/QCce8e+WQFbq+vzgJCcQlaE8SPBpCPG9DwRy8Q8Uv51OZXFYAmFiEJy+sIqwmp4F7+6AWi9/F8evirQguxJnxLARhUCb0FRy1QaX5LPlUhOl+pCBS0FED8tD01A7TR1oKjFojno+FuLgB/xLwCkgqmsDzCGblAlgtWG8AnB07eEn6uYM5PGp78kQvUcsEqgdIzNIn2bmhNw5MfF6j3wqTZ8RJy/CoR6fENt8vbgNcfpcgF8shHbUIiIJHW4aMLXouf8kEOnk9XAdkPK5+dNfy5gns11uJvzac5uAt8MHyA2TF8gNnxA5l637RZ6tP+AAAAAElFTkSuQmCC",4,12,12),
		walk : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAYCAYAAAAF6fiUAAABq0lEQVR4nO2YMU4DQQxF5ya0lLQUSEhpKDkCoqShoqfhECm4BTUdPZfgHEGD9CNjxmuPx6PZMFt8KVLC9/P/s9kN6fo5pU3jNBxgdg0HmF3DAWbXcIDZZf9gSoeSRi9w6vxm+M+Ptx+9vtz/UtQSPQNaM7/J+OludwTGIlStSyAgHk5EQGvnN8NT4MigpBkRAZ0Cv3gpUXNIOkXeBUrwpXBa/dfMXzR9vLk8fodRE9ootP+6PTy8X1QtQP+eB1Q6QZ6AevIvFVzLL4JfnZ/9CYiCS7KCo2QeEPfzFtyLn3++lV8NKC9SUn6fq6aAngFlFvhH83P/Vn616Wxsga8toFfBfOFofvhG8avDcHmVFuHDrAXwr7oleQqu4fceoCh+dRC/yUjt4pL0BqSdIK8/2HEzzK/XxG8ewO/sdIgHngdEF4kKCDP4Ewmuhkh+eNfyq+GXHqmo+E2oBp6HIxXhDUiahTledktGVn7zyUmp/QllyR/B0BJoSC0F8CKoWr3hI/3O0LJR2/WE2xJIj5Ck2ZG+YK3914lq2CN4z2L/1XdouJu2AoZrOMDs+gbjgqswMlJYjwAAAABJRU5ErkJggg==",4,12,12),
		hurt : sprBanditHurt,
		dead : sprBanditDead,
		miniexplo : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAACBUlEQVRoge2YPW7CQBBGP0NEXIAoaFKiNByAJlIu4PQ5B6XbiJaDUOUAVKm5QkSXKg1CEQ0BOZsC1hqWNQTvrDHOvMY/wBuzM94dO0DFiJIw3Z/UV/pYAQj0OYGP2qUvwBPKOA4yzp9NlIQqSkJnT1W4eAFxJoTOPppJfUVnneDgC2cyqa+cHf8KX3ecJ6e+XmsxCXZccnFzSsp9x/nyEqTX+QO0aNhzIWv85dEzf9lnf1nPc+LzDt65qVOVtfcq5UW5cKz34VrWbHcwZ4JNf1mLB6hYAZHisU3RLL0RTe7XSwMA0B6usXM7j2eRfpM8futjPF1/uddg080Zo7fd7CVAJwEM74A0MUC9e/vX4KdeV/deAZnJ1AG4kmw66B/g8L8DKiZuWPY5GAFYzDZYzDasXt/+KAmPjk+eHKQFROWcAYrya0a7rS0BjXnmW4uziAF0xyqN0x6u0Zm2WNy+/cfGJw8HS5hOshmA6w8U4fedYB2nO1bojhU60xbmD8ur8HOPj7UHMgPcP93mklNog5bld20SH8lDQQygP2iiP2h6STCwLXruwizKzzU+aQFN6qtgRD6gAQBg/rB0TvApPwcjyznt/nj79hKDuzh9+c0cm/48+T34QVYfwvUuwqc/SkL0sG2mbf675xo+X39cwxT+Huja/IIgCIIgCIIgCIIgCEL1+AV0tGo8hqmY/gAAAABJRU5ErkJggg==",6,12,12),
		miniexthrow : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAQCAYAAACm53kpAAABnklEQVRYhe1WMU7DMBR9JgVlgYqhEiMLdwCxMeUATPQGPUAmJNQ1d2AsEwfI1K0Sd2BhREIIIZaoyJgh/ta3YztJUVWk9i1J7P/ef//big3ssMNWQ2zaQA8o9r6Kb+V8iy5CXtIfE/fVUQCQydQMlEnVW4PzuUZIpJGUkaDnBP/myGRKsY3EpBPjx4y7BbTxyU9IYxAj5Hqw0M+L2yMAwHC6RJlUymcgkymNq7nWIf7n3YGOQZDPvWQyRe7hD6dLanJMQ/E6CodPEGBbNNQpnpygm0AayGSqyqQiM42Va+OHzK+bP9DmzUQOG9T9j+dvAMDx2b41r1ccZVKJuUzVVb29La2ihc+4jWJIYxLgByDKpDI7KMY3K8YMWYmpAAB4uanDTx/qcHcF2C6wkpNGG59B+XxMuvONRhvfm1wXYxm4fzrE+/mXCYol140AN9CV7zZxVQ9Ui+sBgNEINYD/YHzHDwDg5HpPvD7+eLMSf7wYWYa5TowPAOPFSM0u36J/cHQ7CqMnSScB9t73HuC7A/TV2cg94D9iLTfBHbYdv+DUA4JgslRPAAAAAElFTkSuQmCC",4,12,8),
		hand : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAO0lEQVRIiWNgGAWjYBSMglFAP/AfikkGjMQYfuHoFgYGBgYGA2sfYvXAAROxCskxnBRAVvCMglFAHQAA4OAHuV5+UGMAAAAASUVORK5CYII=",0,12,12),
		sit1 : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAASAAAAAYCAYAAABa3SD0AAAEyUlEQVR4nO2asYsbRxTGP4U0+Rcuha6QyKYJ5tzoMAch27hwEUwgRRAsEiFFCCaFKnUBVS6MYxIIYY8DkyLNxYUKNwcHQviak2XcrFkX2iL3b0wK3YxmZmdX2pmdi9d+Hwzc7ax+s3o7+703owVIJBKJRCKRSCQSiXRDav3fF0DaSazgON0/UqNFE/jdF4snA2PHcHwMuN/DInPjojlC8qaPdzzPdwamDG8WG0Uhbn9539g5ijI8PDljsI8TA4AtBufCV8YxqCnzh/ie+LtcAFvOpwCAy/NTpaOuDLycT3PsGvlAMw2OjaIQQbddelKSZnh4cgZU/y4MAEZRiO++/9l4wl9/PuJsG74Yx3cFR/zm8rdVQGwUhcIc9Ey8nN/HrTv3nDIw55uyfA18oDxAdWR3wKPBJWlWahAu4gZnMn8ACLptjKJQNqGq8l7BEb/Z/LKBRQaWB6ixUsnxix4EB6dmZRkeAG7duWfLFmN4yjDb9mZ0WcUfgIjPJ7/+g9fpS3Se/AJgY3C2FZbvCo74zefrFRCf9OLkJM2QpI/EQLrbFZlGiZQHS+abnNSCL8aRA1TEiScDl0rIa4Y5CjY392B/T+lbrK7E37Mks8EDWFc51yaMN98OAQhTRjwZIEnt2YDfCo74zefnlmAP7h7i8fMXDIDibvwh45MTAP7492u8OlxVu+LNGDl+jv1mhd/Hy8p8SCbHDa4oSHUY3A5LGGsT0o1HPy4bUVXpS6vP/o6V/68rOCfpBvc6fYlvFgsA9Rgc8ZvN1x8KBqwz7yzJwEt0ID9Zd+SZJMzBE1+MwZdG8oMkjO2rtbFdV0BV2GIMfQmjy3UJU7ECeuf4Fc8n/gfI1yugFgB2sL+HWZLh4uKt6CibrADw+PmLKhfCAPjiC0nrT6EfPn2m/O+a5eUMoMs1w0T9ECdPz4zxONjfw2J1hagfYubwHXxWWL6XkMRvPt/0K1iLL8F6vY5iEqaBLCVMSFed/IuLt0qQivg25gZsr9pczS1JM3EPTDe41+s4l9B8opRNIBf5NDjiN59f9DN8CwALum0E3TaSdFMN6UAXw4j66yXMydPNgyzzazIjbzzfGYbvkQXdthIjYBM7SykJpqzC6vU6/Pqt9rF8Gxzxm83/qKxzvYG7fnj4hD/Y31NalcGK+L1eRxzT2S58/SFdrK5Eq0v6tW47bquoHyrNVfFkgKDbRtQPjfHgy7ug2y58U7pEwuAAs/HzY9K9r7qnUJVfWcT3zy99D4hPPP1n5p+GPyrmY7tJqfMvz09zex4ufL5JzKs3U6Bc+J43cQEpRvpyTjtuHfvh+BjxZGCssHifxTjKu1GmfSxucFzE/zD5pRUQgNxLiJfnp4j6Ib44+ryWSkJ/CVFmu/L5EvJJ/Jsx0+tBqirfGQZASzOeFqSb6PoqPWcPx8eYJZnS5D4XDcfHIvZy4wbnKuK/33y2nE/Zcj5lWJfIoo2iUDRYlM83wGfxZMCW8ymLJwOlHQVt0eLJwInPeQ/uHiqNsx34ylgawwfT9bzc56TvXthc40/895afGyTX52g+N8Y3BaouAzWZWs3m02Rt+/7O95f4zeZvK9/5h03nlfXtqpvimzhlfa5j1MUmkUgkEolEIpFIJBKJRKpD/wFfHv1XCtHytwAAAABJRU5ErkJggg==,",12,12,12),
		sit2 : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABCUlEQVRIiWNgGAXDHjASqe4/ufqJseD/3NYkrBLJ1fMImsFCyPDSBGcGY4cgrJKlCQ8Zuhfs/Y/PEny2/y9NcGbQUJXH64Ibtx8ydC/Yi9MsQj5guHH7IUN0aiFWuaWz+wlpJ2yBhqo8g4G1DwMDAwPDzfBkhsu3zzOEnDvHwMDAwDC3NYnhxu2HePXjDSKCziPCLLw+sNVAhL+RghSK3LkHz+Dswzdw+4JgEKEbjC6ObBFZFsAMwOcDfIAJn6SFhQpWw5HFYGpwAVyRjJJ7Fyzei9UHCbHOcD6uXI3XBzCNCbHODOcePEPBCbHOMEPJBv/ntib9Z4AkV5wYSQ15lhDQTJHho4A+AACiB2KrX+40uAAAAABJRU5ErkJggg==",0,12,12),
		ultrabutton : sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAASlSURBVFhHrZhdiBZVGMfPvktpH6ZLJIGhRisEebGQhOsiG22kywrFEgiVGCVeiBKCeONFetFNeLOsKEQJe1GwXUhRi0uwUFCtxCpeFCz4uZISSph9qBirzf+Z83/nOc+cM++85A/Oe87MnDPz/5+P58w7HW6zu+dSXPC55Sefv+Dzp30e4eD4lC+Vea6xzpeq+eXuj75UpuHGs18kDYRXiN84v9AfeKrqR4DwuuJBVf0GxIggmmhDSIkabdsRbom1bUx23pZCYKIF0obTx1Jh4v+IJ/YejWwN5IIyxATndwoIp/hU3YiJ+yGe6Hs1fO4eP7FI8lomANdCqq5aW63ED959KJqq4D3zKIQey4S8+cMT7ve1f8mFymlCID5Wh+YyXu6cSBqgyE8+eEdyy7v7jkp+vHFL8hgdmYAijCoTUQOp3tb1lHiM6lvrL0nZAvEUPntmTvJnV62QnOA8zsFIykRoAFAkRBnBFGbhGmIb1IP4T/uuRR+sxWu0EYonKRNlA0T1ZF1oBKMI8TB0fCZ8aEq8xoonMRPNRRygxO+V34Ib7z8YJA3bUHwK9nQKjoAm1SZuIMHFNzp8qcCaEBLi2fsUWGVE10HCMdpy4RMoKqYQH+xHAL3/YX5GxHetesAflVl84I4vhRGMU6jVvE/RairJqwTmLJIsWiU+xvUz/zYT0eUqbq6el6SBwKqkibWXVwnMWSSaIex9YoXaY26GraCQmCBNnXqlfYAL0RKb/5qVn91rGtD7iI5CmEYzczvd9Ol8s2yX3p5Fbs2KQ0EkqlzEehpBYIqqa5bdG75yu14dEzFMKXQdtEFbS3IEtHg9lexIpMTbEUDvv7exV8r9Q9NueJcUBYxKDPQ2OTbq3HcTefuRyeliEctvC+xI6NQuEA8giEDo0XPfB8mKB2yrCQ1kPcbd1AITqchEuAZ0GNWcunjFl3K0iRS2jr1HcgRsBCIxExBeNwKdPecLHghEOt8/Kwkcful087zGtgVt7cQx6gon3c+EQj7aUUS97YdviwkrHKAN2lrKBjCNevNplBoFEOv15Gu45+0tA5LHhLSCbXgPEhrwO/H+A0+6td8skVPWBI/5xweg3BQfga8R2IwuL98ajAB6nXA0bA7QBm1xD/1OVITRTDguPP/isBySL/7c5k688oc/ivP6+WXu17P/SHn/4G/BCCCM4mGjX271ZwqWXRqTnEL5Ysj3KpqDcAv2BYTS4C8lX7asCQAjT3U/4o/KwMBrj33sevo2FQbwwSv7X8zeB9iU9E48sWlcAsO+TPz1q3/Lua6ljzZNDH29WXKg2z78c6e81BVTKHsoTiBBxMlvj/kLORC35upIs6ctuN4OEEMwLUX8jQWSaIToupbcAD8Noud8ghFrAkCoNQFjIKivPjfa3reCMAIrjxT/K3SZ2La8ZzEC9vtmCxMQ3fF5fyAe9aUDKr6VphATanevG57DKFRhwhqxx3XEc/4yR29ijjOycZOEeEQ1XGOP27Yk/XVaf11DePVwoVvEQLHeCswi1nBaACxmDRevrqPhIq7+vA5oREUpwEjFkUgZwOf1PW6gZCIlLIYdBYo/6Kbcf3KPgkqTx4/fAAAAAElFTkSuQmCC",2,12,16),
		ulthud : [sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAA6ElEQVQ4jZ2TvQ3DIBCFXyCF2cFFChdMEnkD2kiZy5KrSN4AeRIXLrODaRxSxCD+sfKkK/Bx3z0ODPypfm90vzf633oLAaABWNi1sjmSpOri7IGkKrvX6xiGKUq5SkLI0GkzBzdC2GlI6CaEGbnn1ZIqkKHD/fE28wAXzGt2e2mbO2ZkGVUnADQXzEbKGXG7GSeuuGDW1TJtUd6IZDOHlmmzAC5YFlZ6R5BUeUDzvepoHtsIVlqfclQr/jVd7bp4/TnNY4vPc42v34Wh8Kr7vdFk6PK/RQ4WAk9DQlgqcpD4fD4sUnImAL7Og91slJEQBgAAAABJRU5ErkJggg==",0,9,9),sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAABZ0lEQVQ4jY2UsW7CMBCGv1Q8AwsLYukUtQxRlah0QCDxAky8QWfWdAhr5r5BprxAJBBDqYiqDKXK1AVlYeEl3IHasp2E9qRIPt/5838+5Ryu2GTfFbq/Cc5OW25jQAI2wdnebwV2miASsN7uAHh7/wBgFSz1HAPmNEHCKObp8UFB5Fr6q5clk33XUOa0QaQKHXIN5uiQ2XyB5w5bAXqZRflJliYKZryR5w6NkppMvyBLE7WuPfZ0PGK93bUqkjlhFBt7Hb1LcOnUdDwC4Hl7z91tH4Cv74rX8UHlSMWb4Mxk3xVKkev5rF6WrSpsRfJMWeT10lzPp9cfAJf6LwoOBmQ2XwBwqo5mabrT6w9Ugjxgm4zruWC1X1f0l52qI2WRq/bf6MGyyGuSr0F0M0BhFFMWOVmaNAJP1ZEsTSiLvNZ+Zb9/vAijWIRRLAABCNfzhev5ytfj9pipwf7z2ZDaXGm9xTJ7jPwAqL7VSAPx+G8AAAAASUVORK5CYII=",0,9,9)]
	}
	global.info = {
		race_name : "BOMBER",
		race_text : "@gPOCKET BOOMS#@wBANDIT PHYSIOLOGY",
		race_tb_text : "BIGGER BOOMS",
		race_ultra_name : ["Ultra 0 is not used","ALMIGHTY PULL","INVERTED WORLD"],
		race_ultra_text : ["Ultra 0 is not used","@gGRAVITATIONAL PULL","TIME HAS STOPPED"]
	}
	with(instances_matching(CustomDraw,"name","zawurdo")) instance_destroy();
	with(script_bind_draw(draw_zawurdo,-10)){
		persistent = true;
		name = "zawurdo";
		current_time_scale_goal = 30/room_speed;
		global.controller = self;
	}
	with(instances_matching(CustomStep,"name","zawurdo")) instance_destroy();
	with(script_bind_step(step_zawurdo,-10)){
		persistent = true;
		name = "zawurdo";
		current_time_scale_goal = 30/room_speed;
	}
	with(instances_matching(Player,"race",mod_current)){
		create();
	}
	
#macro SPRITE global.sprite
#macro INFO global.info
#macro CONTROLLER global.controller
#macro base_time_scale 30/room_speed

#define race_swep
	return 0;
#define race_mapicon
	return SPRITE.map;
#define race_portrait
	return SPRITE.portrait;
#define race_menu_button
	sprite_index = SPRITE.button;
#define race_name 
	return INFO.race_name;
#define race_text 
	return INFO.race_text;
#define race_ultra_button
	sprite_index = SPRITE.ultrabutton;
	image_index = argument0 - 1;
#define race_ultra_icon
	return SPRITE.ulthud[argument0-1];
#define race_tb_text 
	return INFO.race_tb_text;
#define race_ultra_name 
	if argument0 < array_length_1d(INFO.race_ultra_name)
		return INFO.race_ultra_name[argument0];
#define race_ultra_text
	if argument0 < array_length_1d(INFO.race_ultra_name)
		return INFO.race_ultra_text[argument0];
	
#define game_start 
	maxhealth = 4;
	my_health = 4;
	with(instances_matching(CustomDraw,"name","zawurdo")) instance_destroy();
	with(script_bind_draw(draw_zawurdo,-10)){
		persistent = true;
		name = "zawurdo";
		current_time_scale_goal = base_time_scale;
		global.controller = self;
	}
	with(instances_matching(CustomStep,"name","zawurdo")) instance_destroy();
	with(script_bind_step(step_zawurdo,-10)){
		persistent = true;
		name = "zawurdo";
		current_time_scale_goal = base_time_scale;
	}
	
#define create 
	spr_idle = SPRITE.idle;
	spr_walk = SPRITE.walk;
	spr_hurt = SPRITE.hurt;
	spr_dead = SPRITE.dead;
	spr_sit1 = SPRITE.sit1;
	spr_sit2 = SPRITE.sit2;
	maxhealth = 4;
	bandit_chrg = 0;
	zawurdo = 0;
	CONTROLLER.current_time_scale_goal = base_time_scale;
	image_speed = 0.40;
	
#define exthrow_step 
	if speed < 1 || target != self{
		sprite_index = SPRITE.miniexplo;
		image_angle = 0;
	}
	if target != self{
		if !instance_exists(target) target = self;
		x = target.x;
		y = target.y;
	}
	lifetime -= current_time_scale;
	if lifetime < 30 && ultra_get(mod_current,1) = 1{
		if lifetime + current_time_scale >= 30{
			sound_play(sndUltraGrenadeSuck);
		}
		with(enemy){
			if distance_to_object(other) < 100 && other.target != self{
				var dir = point_direction(x,y,other.x,other.y);
				x += lengthdir_x(4,dir);
				y += lengthdir_y(4,dir);
			}
		}
	}
	if lifetime <= 0{
		with(instance_create(x,y,Slash)){
			team = other.team;
			creator = other.creator;
			image_xscale = 1.5;
			image_yscale = 1.5;
			damage = (10 + floor(GameCont.level * 0.5) * skill_get(5) * 1.5);
			sprite_index = sprPortalClear;
			image_alpha = 0;
		}
		var maxi = 5 + (skill_get(5) * 3);
		for(var i = 0;i<=maxi;i++){
			with(instance_create(x,y,HorrorBullet)){
				team = other.team;
				direction = (360/(maxi+1)) * i;
				image_angle = direction;
				speed = 6;
			}
		}
		with(instance_create(x,y,RecycleGland)){
			sprite_index = sprExploGuardianDead;
			image_xscale = 0.33;
			image_yscale = 0.33;
			sound_play(sndExploGuardianDead);
		}
		instance_destroy();
	}
	
#define exthrow_wall 
	if speed > 0{
		if hspeed < 0 image_xscale = -1
			else image_xscale = 1;
			
		
		x += 6 * image_xscale;
		speed = 0;
		sound_play(sndGrenadeStickWall);
		mask_index = mskNone;
	}
	
#define exthrow_enemy
	if target = self && speed > 0{
		target = other;
		speed = 0;
		sound_play(sndGrenadeStickWall);
		if ultra_get(mod_current,1) = 1{
			lifetime = 60;
		}
		mask_index = mskNone;
	}
#define exthrow_draw 
	var xx = x;
	var yy = y;
	if sprite_index = SPRITE.miniexplo{
		for(var i = -1;i<=1;i++){
			for(var o = -1;o<=1;o++){
				draw_sprite_ext(sprite_index,current_frame * 0.40 mod 6, xx+i,yy+o,image_xscale,image_yscale,0,c_black,image_alpha);
			}
		}
	}
	draw_sprite_ext(sprite_index, current_frame * 0.40 mod sprite_get_number(sprite_index), x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
#define step
	maxspeed = 4;
	if(canspec) && !zawurdo{
		if button_check(index,"spec") || (usespec && bandit_chrg < 15 + (ultra_get(mod_current,2) * 135)){
			bandit_chrg = min(bandit_chrg + (current_time_scale * 2),15 + (ultra_get(mod_current,2) * 135));
			if bandit_chrg = 150{
				sound_play(sndCrownCurses);
				sound_play_pitch(sndPlasmaHugeUpg,0.6);
				bandit_chrg = -30;
				with(instances_matching(Player,"race",mod_current)){
					CONTROLLER.current_time_scale_goal = (base_time_scale) * 0.05;
					zawurdo += 30 * 7;
					with(instance_create(x - lengthdir_x(bandit_chrg,gunangle),y-lengthdir_y(bandit_chrg,gunangle),RecycleGland)){
						sprite_index = sprExploGuardianDead;
						image_xscale = 0.5;
						image_yscale = 0.5;
						sound_play_pitchvol(sndExploGuardianDead,1.2,0.4);
					}
				}
			}
		}else{
			if bandit_chrg >= 15{
				sound_play_pitchvol(sndExploGuardianHurt,1.2,0.4);
				var xx = x - lengthdir_x((min(15,bandit_chrg) *0.50) * right,right);
				var yy = y - lengthdir_y((min(15,bandit_chrg) * 0.33),gunangle);
				with(instance_create(x,y,CustomProjectile)){
					creator = other;
					team = creator.team;
					target = self;
					mask_index = mskAlly;
					speed = 8;
					direction = creator.gunangle;
					image_angle = direction;
					sprite_index = SPRITE.miniexthrow;
					image_speed = 0.40;
					lifetime = 30 + (ultra_get(mod_current,1) * 15);
					if creator.gunangle > 180 depth = creator.depth - 1
						else depth = creator.depth + 1;
						
					on_step = script_ref_create(exthrow_step);
					on_draw = script_ref_create(exthrow_draw);
					on_wall = script_ref_create(exthrow_wall);
					on_hit = script_ref_create(exthrow_enemy);
				}
				bandit_chrg = -20;
			}else{
				if bandit_chrg > 0{
					bandit_chrg = max(bandit_chrg - current_time_scale,0)
				}else bandit_chrg = median(0,bandit_chrg + current_time_scale,-20);
			}
		}
	}
	// bandit_chrg also acts as a 5 frame cooldown timer between uses
	// mostly visual, but still.
	if bandit_chrg < 0{
		bandit_chrg = min(bandit_chrg + current_time_scale,0);
	}
	if zawurdo > 0{
		zawurdo -= base_time_scale;
		if zawurdo <= 0{
			with(instances_matching(Player,"race",mod_current)){
				if zawurdo <= 0{
					CONTROLLER.current_time_scale_goal = 30/room_speed;
					sound_play_pitch(sndPlasmaReloadUpg,0.7);
				}
			}
		}
	}
	
#define draw_zawurdo 
	for(var i = 0;i<maxp;i++){
		if button_pressed(0,"paus"){
			current_time_scale = base_time_scale;
		}
	}
	if !instance_exists(Player){
		current_time_scale_goal = base_time_scale;
	}
	draw_set_color(c_white);
	var xx,yy,xsc,ysc;
	xx = view_xview_nonsync + game_width/2;
	yy = view_yview_nonsync + game_height/2;
	xsc = floor(game_width * (1 - (room_speed/30) * current_time_scale));
	ysc = floor(game_height * (1 - (room_speed/30) * current_time_scale))
	if current_time_scale != current_time_scale_goal{
		current_time_scale += (current_time_scale_goal - current_time_scale) * (1/16);
	}
	if xsc > 0{
		draw_set_blend_mode_ext(bm_inv_dest_colour, bm_zero);
		draw_circle(xx,yy,xsc, 0);//draw_rectangle(xx-xsc,yy-ysc,xx+xsc,yy+ysc,0)
		draw_set_blend_mode(bm_normal);
	}
	
#define step_zawurdo 
	with(Player){
		if "vspd" not in self{
			vspd = 0;
			hspd = 0;
		}
		var basescale = base_time_scale;
		if abs(current_time_scale - base_time_scale) > 0.10{ //current_time_scale < basescale{
			var ang = gunangle;
			var t = basescale - current_time_scale;
			var vp = button_check(index,"sout") - button_check(index,"nort");
			var hp = button_check(index,"east") - button_check(index,"west");
			if(hp != 0){
				hspd = median(-maxspeed,hspd + hp,maxspeed);
				sprite_index = spr_walk;
			}else{
				if hspd != 0{
					hspd -= friction * sign(hspd)
					if abs(hspd) <= 0.10 hspd = 0;
				}
			}
			
			if(vp != 0){
				vspd = median(-maxspeed,vspd + vp,maxspeed);
				sprite_index = spr_walk;
			}else{
				if vspd != 0{
					vspd -= friction * sign(vspd)
					if abs(vspd) <= 0.10 vspd = 0;
				}
			}
			gunangle = point_direction(view_xview[index], view_yview[index], x-game_width/2, y-game_height/2)
			weapon_post(0,floor(point_distance(view_xview[index], view_yview[index], x-game_width/2, y-game_height/2)/10),0)
			gunangle = ang;
			speed = 0;
			if (reload > 0) reload -= 1 - current_time_scale;
			if !place_meeting(x+hspd,y,Wall) x += hspd * t;
			if !place_meeting(x,y+vspd,Wall) y += vspd * t;
			
			image_index += 0.40 * basescale;
		}else{
			if vspd != 0{
				vspeed = vspd;
				vspd = 0;
			}
			if hspd != 0{
				hspeed = hspd;
				hspd = 0;
			}
			image_speed = 0.40;
		}
	}
#define draw 
	var xx = x - lengthdir_x((min(15,bandit_chrg) *0.50) * right,right);
	var yy = y - lengthdir_y((min(15,bandit_chrg) * 0.33),gunangle);
	if bandit_chrg > 60{
		xx += irandom_range(-1,1);
		yy += irandom_range(-1,1);
	}
	for(var i = -1;i<=1;i++){
		for(var o = -1;o<=1;o++){
			if(bandit_chrg >= 0) draw_sprite_ext(SPRITE.miniexplo,current_frame * 0.40 mod 6, xx+i,yy+o,right,image_yscale,angle,c_black,image_alpha);
			draw_sprite_ext(SPRITE.hand,0,xx+i,yy+o,right,image_yscale,angle,c_black,image_alpha);
		}
	}
	if(visible) draw_sprite_ext(sprite_index,image_index,x,y,right,1,angle,image_blend,image_alpha);
	if(bandit_chrg >= 0) draw_sprite_ext(SPRITE.miniexplo,current_frame * 0.40 mod 6, xx,yy,right,image_yscale,angle,image_blend,image_alpha);
	draw_sprite_ext(SPRITE.hand,0, xx,yy,right,image_yscale,angle,image_blend,image_alpha);