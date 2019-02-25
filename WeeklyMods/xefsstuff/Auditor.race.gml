#define init // When Mod is First Loaded
global.spr_AuditorIdle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAWgAAAAYCAMAAADgbpeSAAAAJ1BMVEUAAAAAAAAOHikdGhcgN0YyLitGWntITDxVepJ5fmuqr5fY4vH///+CcWRXAAAAAXRSTlMAQObYZgAAASpJREFUeAHt1M1q7DAMxXGfyB928v7ve2PnWgsVDSNK6EI6iy5+Cf+ACpNif7IYeLq//gEHjrwnvf+fva+H/DryJ29j/LIvQ14d2eSGvv0D4dAc0DvfhcJbG9PPs/cBiPeJyhpB7+ihcHFQIiryoOt92vvZIfG+Hgrnw9UK1PkHEO/XZ6zcIdlZIawGh9z6tScOWvelxU/KIrCrfQ6BnySvDqKSrz3h4EuLjuaYjukixF927ce89Lh3SUet02UH+9LSl62+DAEzBPj2I7d759kaVBcd/gfofT3k2Mdo572hu72vhzx6Ao65vJxZdXNfhtx6wtTce2P+6Hj8q74IhZcj93tZd3tfD3n1hFKwRrrb+3rIs08A6W7uiwcLwl/2hAcQ/pbbF4vFYv8Aw4I+Xa1+8VYAAAAASUVORK5CYII=",15,12,12);
global.spr_AuditorWalk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAAKlBMVEUAAAAAAAAOHikdGhcgN0YjIB4yLis2MzBGWntITDxVepJ5fmuqr5f///+yOFdLAAAAAXRSTlMAQObYZgAAAbdJREFUeAHtVOGOnjAMw22glPL+z7umZBx1iHbbSZNOOv/gk+LEdv3jW74fcOM/6wT7kMOAL/lCRP5ORwwgHZWprZFQ4Bz6Dvkh9Gmdw0DzKBB4Tr6sEwWCn4e+TCBsLvD9LOHnsW+tTYnzPI4GBAfAn33rUFIhAEFQ8jX9xklzztuFjDlQzjRnXzJe17UoVprfB6Q/xiTU9bEDuD6YXpB/A4EvqCHV2PeXhvhg6Psi7AB3Im5uv+B8X4yRkogRWOhgNZ2bwOz7IHpIAYyh5nbTd759RusqlJMnrCHWGeve1wIlZVoHN4SRSD/si71O60YkcQTwrDT2nYgkteM8a+XmNAwLFe1o7HMgR8TNsS8TrdWzo4FfsLeOl0CtvQZKTFBzPCZfBZAUMoj4BeybrAjSESai5mD75stC9keRM6Lm2FcSBVqUKKUMC0TN0b7ItT4VtG1bkkMhI5CBXuB9+y8WSlSU6UJwzWVfafrwfcw1Dx6YDjZ7QZ4uzHbyNW+gFCi4Cb2wQN7Z5A127fFRXeaLUkyGMWXhTukF2IAgwTvwwOw9FGhGr/PNwTWH5Z+BV+8vKHwv/OAX6j8btyr4CCMAAAAASUVORK5CYII=",6,12,12);
global.spr_AuditorHurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAMAAABuvUuCAAAAIVBMVEUAAAAAAAAOHikdGhcgN0YyLitITDxVepJ5fmuqr5f///8PQ6QCAAAAAXRSTlMAQObYZgAAAMlJREFUeAHllLFuwzAMBXOmLEv6/w8upRZElfrBHLrlBg+HvDNAIH79NyPYPUHODxGiXD+Q8kOEKHNQW/NBxg8RotwPKJnQEAO0D4YoUWubg96vq4H2IjR+v9nMzm8M7XUo3hwS2D2wHpC6UWj+eFiPxInMzvdQeKKUCx2z1JzBm2f36kQxOEp1eq8V5bOh1mp3Gto/HptjUtYA4XP/kflzxxcgfDbkZ72cYkifKp0nCzMj4V+xvwnFh+zZO9t+W5D0Ebr3oP2n8AUZNxLdJWkNXwAAAABJRU5ErkJggg==",3,12,12);
global.spr_AuditorDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAANlBMVEUAAAAAAAAOHikVJC8dGhcgN0YjIB4mO0oyLis2MzBITDxMUEFVepJXepF5fmt6f22qr5f///+m9uIEAAAAAXRSTlMAQObYZgAAAXVJREFUeAHNlt1uqzAQBjPBQI4NBt7/Zc+anxWrxFouSpS5QNUg9RsVl+TxqyyK9SiOv63HBtEOOzj+tp7F7pbhmLMdNv7unsXu2mH13wxaKsM4/p4gW0SMuQzP8zBkcPx9Qcv5LxFCeG0EPH9/UIxZJWA9sF7gq2dINW8e1ov/CnHgwD1C8lRs0MmjRc5/rAKK1ePOpaBnKcqCDFuP8c6v0l1dVt33/TjKxQRZzPCzjcI8x0jdu0G6a5aFzY9pmq4H5RxnIVP3bpDuCvUg3EPNs9Cuw/j+chDqSWk6gibck0iZFWQZXF8JsrvnZWjYHmKa57HnUpAc30FoA76vP3zdFfp9GbqmaaS06/6tcKXo9WIlhIDnlzeOnNOuLtN1Jahb2XxnT5H9QYfRl0jd2xybBGZXl5EeQSToLXTBdJhlrvnlM593yzIgHlGgnINqr3XHe0F21y4Dx41JEPm3fOo576aUpkJK2M+TtMMXv1lZHhbVv8h/2T86AjwZz00AAAAASUVORK5CYII=",6,12,12);

global.spr_AuditorSit = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAMAAADXqc3KAAAAJFBMVEUAAAAAAAAVJC8jIB4mO0o2MzBKXHxMUEFVepJXepF6f22nrZd/Xpc8AAAAAXRSTlMAQObYZgAAAHlJREFUeNqtj0EOxDAIA2MKjUr+/981raKtOXcOWPIICcb3YNP7a6MGziozOR1dOIU3ARF4iVnNWqtiQjaOeDjaxnmiqNAN/I1sxMuECAOyAKyJOSev4uwicxWZKmBmt2BCXje+xp7/GYaICKrLI1TUwTfMoQA7vucHgVEEen7A7X4AAAAASUVORK5CYII=",1,12,12);
global.spr_AuditorGoSit = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAMAAABuvUuCAAAAJFBMVEUAAAAAAAAVJC8jIB4mO0o2MzBKXHxMUEFVepJXepF6f22nrZd/Xpc8AAAAAXRSTlMAQObYZgAAAMVJREFUeAHdkdGqwzAMQyvXbqj9//975VsCXZnxIC9jeohBjnQC2b5WmFrtOaewBIaywt15Kt7eB1rwLFIW6aMItwA+AOOlCHWgBY90IiLHQA1owdDdLu19oAZzcRxI5Rh1oANzgVtTGWjBG+zWZGWgBbNIAE8BYmWgBWfRGCMieIqVgRacC/dIuUsdaMEbICKR4kQZ6MAUhB9Mn78s9UtbcBaJ6skaFelfWoJzYfZfZCZ4+gxMv7lPwXDJlnwKmGPN/0X9ASzHDVonkWaHAAAAAElFTkSuQmCC",3,12,12);

global.spr_AuditorPort = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAASFBMVEUAAAAAAAAGDhQOHikRDxUUEhAWKTUdGhcdGyMgN0YlJCsrJyMvLjQyLiszNik0RF87YntEQ0xGWntITDxRUFhVepJ5fmuqr5chnwpuAAAAAXRSTlMAQObYZgAACStJREFUeAHswYEAAAAAgKD9qRepAgAAAAAAgMmxG1W3YRiK4/iWJAjTIjA+ev83XT4y0Sx1mzsPJN39n6A/GnFI4pc+F98QxZU6cungvXqItwJINkO9Fp9cziD1+/3WeIKMXP8mlfiBUA0uUQhbSuwhKkk+HIkovEQhVINLFMK1k+LiRJZqcIlCOLhEIVS7JckHhO0l9hCVeIBQ7Yr9QLhf4gNCtS92A+HgENLqpyAC1Fa+IQDkj+AewvVUgZxDRIi8CuEeLTpDgFJKQMgccMKEhCgjOATyIt87wsEh438CkauQNGfHeIbUyxD8ZAj7h7g+EYUAIvg3kCU7SBHZJdwHSVt2EKySNgRRIEWW+iEAwkFQzzFEYAuBiKAfInOWkPVIcGu86BI9Ho9yjKh6g6S1r6/bbfwJkNscvYEUOQRqfWARWEIACEaFnCXlMgRpznZG6C0ER0j7g6kpRJedL0LIM0TeQsqFJ4sBv8OuEse3rpCke1jbEADqQG1CxBSSAMEGme57OWee2yCHWmAWH3u4Djsr5ENZUzHDxx6ORNyAXLXtO2LmyDl/LY4uyEoBkiFk++15gXAf5J6TG0i+R5MoZJiySmjohNyNISrphmSVGEAmhYxDH0Ml5pApd0vSmjHkNuWnev6SZAi5L5AXfReX7SC5AdHavA6JGeQ6KseCtFE2kOkZMuz1WYbBHPKrmTvcTlRXwzi+kmCivlu6ZnuW+/7v9JA3/jVpICID4vPFsVImvz6JINo6UwbYu7qvgbRTwL4b8vOv5meuKpC7cVeI5I2oA8lLkbsfSQ3ZCXIpIFSi4c5DwsM//CNB0j52hRxqSFEJ4y3zfGS4dV8H8UDKSsrwMKSfB0SK8e8GOQ3xZrSS50Wt2+05udgwQuSLID5K8p85EhBYgCL5cT4oxOwMkQJSSQoHEiaXxp/C5Zsg3pUHxOS4MvyYhHpUgiNB5Dsg4px+5I9RU8n1Nty7Et3i0RgQv/cS4XJQgvRD1PHs4N8CMERNpqzEn/ZdIkAOD8j1mr1ZCEYRhQ8IlZx8uHwFRBKkv/ZA8kTHLxyl/ADZd4kYohCxfcwLCBLWfZqAux5FTB7rhjwgjI9R11+rOroxs3ZDILHJ0d+eRTD+/npjsdDO00ZuzKx9EIdDemEakyD/jUMGBdF7/a4Q8ysiF5EQc3hAbrcRCEECJPaERORDjhqRgiRBeK6NFbBGgOQBolqNifksAwSRJLkCUQurQUl1bjtBDOF17YhkgFyB3DW5Q5HcZEjm2EcgY01Ukp5R1qkhDB/S7fa5PqYUSA7MrJehrTQBb/oP84lGcLyWXEmGmqczZC8HCTEHxwQahTQa63Fsabk7xForySNjlcQ452zfl4VUEHD5V+L+N5UAUYamueAPLsaSAQWJ1BBlp13I5hC5WJIkMlkJElI+WzFy7oUUdodlK4gW4uPFBW+tHYXIkHBIjSChlBoCIHMQlWw3s2xUaLxWEqRU0AapKsljrc0QcimzKUTUgSRCVAICwzyJzs+Y6fdCt/09F2JFV4RIUjjiB6QvJKRgaEKA8kEIDuITJCURPFvkFlsEhsbFhCEjmrABhEJOZUI+nTJDhbETcQRQxpENIb4aqGsoSkub4X2+sYICkM0LYaAgxh2G/KKUhCI+eozmQ4W0A4NQiyfZVguyciFtxtZZ5vCLHFzp/QILkCWOdPlB06Scs/zTCNuUkm0LSQ4Yfd/nY10h5wWSpRMLR8/Q18v5eDx2HZB1Jpb3fqIQdayswKFBskohLsZPFDLUsT4DB5J1CvHOlRQgFLKNg7wL8W0HlA8VgoJK1ijE5fH+odsScl4EMfMKgRJjUpbPrD/NUEjKOpDi5ZMpQiHTA/3fsvyhkGclsx3ulcN2Xbn3ITVk8eiLUMgCiPVth80VpEsHwyRYDmgXwtxaXEjDQW4K6UGsD6F6o5lViGs4gJx/P6kws8pJtebMOp/zU645hfi2w+Igx5j/gBBAf2f6A+TMD61DsrAQVxZyzs60S0g7CGfnjGP+GReFAPGaqpDRJQLkuMVpb+lA8roQ/xi3HyvEjjq6BKGrlSHn7MDYdUnyuhAfFVQxt5AufcCBCR2z4nmWrrIzZXRzINZSBYQYN10IkKvmWAaVriSE6eatQu6rnuWhB5MXhdgng/EXKQvpYnJIf5xIumDcdXpbKptRyD+PVW803SsIDhQi93dAXDmzuu7A1U59OHL6SYh+3uOi0Vsk8/OYY91LCIXcHSiIZJCuA0FU041CeBdEAdwuh5h5EArxKAi1KCQMjrF3rtTRFxLdcAUIc4xj4bF7BUkvMVw5ykJTvdVEpL8nh1yILIeQdyBWITjGIlrHaEIl6SYh3VIIM6sBMUBwTEkmHzlUEKm16QbIu6GQVxCnuSyEhLvkfkZxXg/SFZV0MyHShsj06jkkCU8zYxABotQhMyEkHbbMnCUSLs1IJSh+SaqEFN9WQ8iZTEK68u48iMyHEHlKzCBhatUQIkodywip05SONsQBeTsBidF0+tSfIPIWhNyHD4MYgmMaEkJYDjGP6Lm2QsbTnV9CTDNzILICJEWmIe0z/WFqLXWwRsKSSuQJsfMgks16TIXjuIBQQeRNBg6FxLyC0CGY+qVL85lpfYiIZAwg97Qhwn9k8iDDsRBi7pCwaGapo4QEeX1s3eSddauQZiXSXuu2gGR7konzAjHP2NUgJkKQrADR15EhiHYmTKcKYskaDioJTYnMhyCpUu7B/IKs8emTpgRIGPvqJGSUIlUhq0KQhJZEJEw7IsSRtqSGuJjVIJrQoAQJUiKUgQNILRmjIMEBZCVJQfllkQESEIzOrBIyh2IMDCArSqCUFpFsCDK61t0viFNJkyKGQoBsQcGCQpOO5zIDoreTEvb8uEzrgaxGIc2//PGgSAnxpxgPZBBlEiGXZxSi3wZkZQqa0TyHlTkYUEyE+AihlOmnwkj2JyDrU5p5cGDkf8WYRk655FDNTLIVBM3bqSGFJCHGK3GnErKvpppZp0IyfVrNthtCCtJz+doaYZ3m9AuChD9jNRr5NMSVGfuEdQU5PSAGyFglbg9II6ca4hO6qOTrIRTCWi8gjVUiurH5GgiOEYgzjUokaH0fg7xi4CghpwKCpGAEhfi/gfwf0b8ZXDMznqIAAAAASUVORK5CYII=",1,40,243);
global.spr_AuditorIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAAJFBMVEUAAAAAAAAVJC8jIB4mO0o2MzBKXHxMUEFXepF6f22nrZf////91/UiAAAAAXRSTlMAQObYZgAAAGxJREFUeNp90DkWgDAIRVEZAn72v2BDVMRCX0NyDxXbd1Q10/1K6W1AaaEC2pDeSCf6+kWs4XRvioyVSNs0mpnN0TattDZlUOmQQiXDjEw7wj3CHR05LZU7AonAgzPmROZ898NFnPP3nsXbTwfeCARbgeWtPAAAAABJRU5ErkJggg==",1,10,10);
global.spr_AuditorSlct = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAMAAADEfo0+AAAAJ1BMVEUAAAAOHikZIDMdGhcgN0YyLis7YntGWntITDxVepJ5fmuqr5f////Q+MHEAAAAYUlEQVR4AX3KURKDQAiD4URStPT+9+2yszMitX5P5B+wNdhQ5fT3ydm2ROTxWTSsENcQcUQqIZ6DX4L/BD8DJULuNQgaeEycH5whhgwkwAFpXfYqzAxtZyhugzX4b9/vyxcjlQenbQlTOwAAAABJRU5ErkJggg==",1,0,0);

global.spr_AuditorAcar = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAJFBMVEUAAAAAAAAOHikdGhcgN0YyLitKXHxMUEFVepJ6f22nrZfF0eci8zqSAAAAAXRSTlMAQObYZgAAAMJJREFUeNrV0kEOgzAMRNFOXGMm3P++HUNSdxG6bv8KMU9RhHj8ZsCXLds23BiAvfftOLbeVwLB7u4J3PkpcBVAASPwcXAWGIBMYAwgEcj9aoAgQ0DlEx7QtARuT7UCxzGA3rUBRFtDXfIN8oRc64QCNkGut2BxBwntd4B9xiVgfVNI6G4J5h0jAgVS6IATkF2FEQWyIKMJhJmf0WfG+RACYy9glmDP3AS0L07Yn1mCt7AoENonkFjUzr0BX/9ezX/SC4MrC8XjYJ/SAAAAAElFTkSuQmCC",1,16,16);

global.msk_AuditorAcar = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAAB1JREFUeAFjGCmAES8AyhMAJCkYVTCqgGCSGxIAANIgAn2kJgjyAAAAAElFTkSuQmCC",1,16,16);

global.spr_ultport[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAMAAAA/gEgKAAAALVBMVEUAAAAGEAAOHikRKQEdGhcgN0YyLitGWntMUEFVepJ6f22Yl5WnrZfe3dv////cV317AAAA3ElEQVR42m3NUY6EMAwDUC8kJbTl/tddu1FmAI2BfvjVAvsO8FD+7gEzp+iFMOUHoSkiSaag6C6Cn1Jgk+kdd5grUB4TfHIcEqAgqzwINfsuhIIoqFpRiQccB98U0hdU1qTk0+vbfKKg+lWfp6RA1ebMqUgSqtFZskDFU5CLeb4FE4LuD3Hf4BLYXF0lb3QQOBHUpARNk/f/twS/i9Y9YqDdxdX2uK6xoHvdZMJsXHwEQfFg2YwPgQEhRrAdwyyBqx4Ei6HtJYjOmAIYgT0hVkdu7HeYhInIsmW//wO/SQ8baRZewgAAAABJRU5ErkJggg==",1,12,16);
global.spr_ulticon[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAMAAABhEH5lAAAAJFBMVEUAAAACAABExxcAAAACAABExxdIVF58gou5v8a8vcbq6Nb///8nAAJBAAAAA3RSTlMAAAD6dsTeAAAAcUlEQVR42m3QAQrEIBBDUV2d1Rnvf9/Nt522lA1UyCOgtBQ7U+5Yt0aktZ5C5pwoCEWEY6gMGiO6swTtou6u5VqyJB0DWgdFPIiZ0eJNmPKgr+L6NrVcJeWNtJ7vgj7ZAESxqyN1UzPKBiSJnvDnF/4AWPYGSJ0JrSoAAAAASUVORK5CYII=",1,9,9);

global.spr_ultport[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAMAAAA/gEgKAAAAKlBMVEUAAAAGEAAOHikRKQEdGhcgN0YyLis2CwdMUEFVepJeDQR6f22nrZf///++a985AAAAv0lEQVR4AY3N4WrGIAxG4ayLmhnv/3p3Ur+K6fyxA6XwPgTla++b5FMaYx4z+TPrTNZM91xnkvY1A6c9g/i+A9tBPQF7vtgOUv8AU6pRAvacbAeV3iBWSrmCHpVn/yEQDv+AjLnz0Y2X5H0KNgDx907AcS8L+NKBBlyHgwC7yhuGqkgD6ADNHKA3dGSM8hToWnmjd2D2oN1gzWiYyPDhzu7NAtRNVS0CzN3sBmRl1Hu8qkBIrcsaYAqQQNhUI36/IHkQS32fbEEAAAAASUVORK5CYII=",1,12,16);
global.spr_ulticon[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAMAAABhEH5lAAAAGFBMVEUAAAAAAABExxdIVF58gou8vcbq6Nb///8DkftzAAAAAXRSTlMAQObYZgAAAF5JREFUeNptz0EOwCAIRFFhlPsfuTOBIk36N5IXE3Qp71bl1vkrp5MVWTD7kpqErmljKx6/lBKaGY+g6U4AuREI3Ss6bJJ1RYgRkvjd/A6HIq5P4oBaeeuHjSSym+QB+ocDIRO87iwAAAAASUVORK5CYII=",1,9,9);

global.spr_AuditorArrow1 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAABZJREFUeAFjIBowMjJiitBICa0UEAYAE+gAJY80kyMAAAAASUVORK5CYII=",1,8,8);
global.spr_AuditorArrow2 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAACVBMVEUAAADPz8////8mCOLpAAAAAXRSTlMAQObYZgAAAB9JREFUGNNjYEQCDGDAyMjEyAQBjNgF6KWELgpQvQ8Aog4BMaUiCFAAAAAASUVORK5CYII=",1,8,8);

global.spr_AuditorArrowSmall = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAkAAAAICAMAAAAcEyWHAAAADFBMVEUA//8uwvrPz8/////ZQATtAAAAAnRSTlMAAHaTzTgAAAAhSURBVAjXY2CCAEZGBkYmJmYmZmYmBmQWnInEwqIObgoAFn4Aj81Qa5cAAAAASUVORK5CYII=",1,4.5,4);

global.CircleDrawer = noone;

//Pick sound by Zandorum -- thanks!
var _race = [];
for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
while(true){
 
  for(var i = 0; i < maxp; i++){
    var r = player_get_race(i);
    if(_race[i] != r && r == "auditor"){
      sound_play_pitch(sndEliteInspectorEnter, 1.1);
    }
    _race[i] = r;
  }
 
  wait(1);
 
}

///////////////////////////////////////////////////////////////////////////////////////////
#define game_start
global.ultra[1] = 0;
global.ultra[2] = 0;

#define create

spr_idle = global.spr_AuditorIdle;
spr_walk = global.spr_AuditorWalk;
spr_hurt = global.spr_AuditorHurt;
spr_dead = global.spr_AuditorDead;
spr_sit1 = global.spr_AuditorGoSit;
spr_sit2 = global.spr_AuditorSit;

snd_hurt = sndInspectorHurtM;
snd_dead = sndInspectorDeadM;
snd_lowh = sndInspectorStartM;
snd_lowa = sndInspectorStartM;
	
snd_wrld = sndInspectorEnterM;
	
snd_cptn = sndInspectorEnterM;
snd_thrn = sndInspectorEnterM;
snd_valt = sndInspectorEnterM;
snd_chst = sndInspectorEnterM;
snd_spch = sndInspectorEnterM;
snd_idpd = sndInspectorEnterM;

maxhealth = 8;

if ("wep" in self) && (wep = 1) && mod_exists("weapon", "cricket"){
    wep = "cricket";
}

drawrad = 0;
timegro = 0;
pushtim = 0;

drawraddeg1 = 0;
drawraddeg2 = 0;
drawraddeg3 = 0;
drawraddeg4 = 0;

whistletime = 0;

areleased = 0;

carright = 0;
cartime = 0;
carspawnx = 0;
carspawny = 0;

lastarea = 0;
lastsubarea = 0;

#define step

// Passive
/*
if (my_health = 1) && (passtime = -1) passtime = 150;
if (my_health != 1) passtime = -1;
if (passtime > 0) passtime -= 1;

if (passtime > 0) && (my_health > 0){
	if sprite_index = spr_idle sprite_index = spr_walk;
	with instance_create(x,y-5,Smoke){
		direction = 85 + random(10);
		speed = random(2) + 1
	}
	with (Corpse) if ((distance_to_point(other.x,other.y)) <= 125) && ("desicrated" not in self){
		desicrated = 1;
		if (irandom(11) = 1){
			instance_create(x,y,MeatExplosion);
			instance_create(x,y,HPPickup);
			instance_destroy();
		}
	}
}
*/
with (AmmoPickup) if (distance_to_point(other.x,other.y) <= 20) && ("auditorpassive" not in self){
	auditorpassive = 1;
	other.timegro += 900;
	
	repeat(10) with instance_create(other.x,other.y,Dust){
	direction = random(360);
	speed = 3 + random(3);
	}
	
	with(other){
		with(enemy) if (team != other.team) && (distance_to_point(other.x,other.y) <= 100){
			motion_add(point_direction(x,y,other.x,other.y)-180,10);
		}
		with(projectile) if (team != other.team) && (distance_to_point(other.x,other.y) <= 100){
			motion_add(point_direction(x,y,other.x,other.y)-180,1);
			image_angle = direction;
		}
	}
}
with (HPPickup) if (distance_to_point(other.x,other.y) <= 20) && ("auditorpassive" not in self){
	auditorpassive = 1;
	other.timegro += 1800;
	
	repeat(20) with instance_create(other.x,other.y,Dust){
	direction = random(360);
	speed = 4 + random(4);
	}
	
	with(other){
		with(enemy) if (team != other.team) && (distance_to_point(other.x,other.y) <= 100){
			motion_add(point_direction(x,y,other.x,other.y)-180,20);
		}
		with(projectile) if (team != other.team) && (distance_to_point(other.x,other.y) <= 100){
			motion_add(point_direction(x,y,other.x,other.y)-180,2);
			image_angle = direction;
		}
	}
}

// Active

if button_pressed(index,"spec"){
	if !instance_exists(global.CircleDrawer) {
		global.CircleDrawer = instance_create(0, 0, CustomObject);
		with(global.CircleDrawer){
			script_bind_draw(draw_cricle, depth+0.1);
		}
	}
	areleased = 0;
	drawradexp = 0;
	drawraddeg1 += 45;
	drawraddeg2 -= 45;
}

if !button_check(index,"spec"){
	if areleased = 1{
		drawradexp *= 0.75
		areleased = 0;
	}
	timegro += (1 + (0.5 * GameCont.loops)) * (1 + skill_get(5));
	if drawrad > 0 {
		drawrad -= (1/6)
		drawradexp *= 1.25;
	}
	holdalpha = 0;
}
else {
	if drawrad < 1 drawrad += (1/3)
	pushrad = sqrt(abs(timegro)) + 5;
	pushtim = 0;
	atargetx = mouse_x[other.index]
	atargety = mouse_y[other.index]
	if drawradexp < pushrad drawradexp += (pushrad - drawradexp)/4;
}

if button_released(index,"spec"){
	drawradexp *= 0.75
	whistletime = 17;
	fieldrad = 0;
	fieldalp = 0;
	sound_play_pitchvol(sndVenuz, 1, 1 );
	fieldx = mouse_x[other.index];
	fieldy = mouse_y[other.index];
	pushtim = real(1.5 * sqrt(abs(timegro)) + 30);
	timegro = 0;
	areleased = 1;
}
if whistletime > 0 {
	if whistletime = floor(whistletime){
		with instance_create(x + 10*other.right, y,Dust){
			speed = 3;
			if other.right > 0 direction = 45;
			else direction = 135;
		}
	}
	whistletime -= 0.5;
}

if (pushtim > 0){
	if fieldalp < 1 fieldalp += 0.25;
	if fieldrad < pushrad fieldrad += (pushrad - fieldrad)/4;
	repeat(floor(pushtim/15)){
		var dirc = random(360);
		with instance_create(other.fieldx+lengthdir_x(random(10)+pushrad-10, dirc),other.fieldy+lengthdir_y(random(10)+pushrad-10, dirc),Dust){
		direction = dirc;
		speed = sqrt(abs(other.pushtim))/2;
		}
	}
	with(enemy) if (team != other.team) && (distance_to_point(other.fieldx,other.fieldy) <= other.pushrad){
		motion_add(point_direction(x,y,other.fieldx,other.fieldy)-180,(20 - sqrt(abs(my_health))));
	}
	with(projectile) if (team != other.team) && distance_to_point(other.fieldx,other.fieldy) <= other.pushrad{
		motion_add(point_direction(x,y,other.fieldx,other.fieldy)-180,0.5);
		image_angle = direction;
	}
	pushtim -= 1;
}
else if ("fieldalp" in self) && (fieldalp > 0){
	fieldalp -= 0.25;
	fieldrad *= 1.1;
}

// ultra a
/*
if global.ultra[1] = 1 {

	if ((GameCont.area != lastarea) || (GameCont.subarea != lastsubarea)) && (instance_exists(GenCont) || instance_exists(Spiral)) && (GameCont.area != 107){
		carright = choose(-1,1);
		cartime = 60;
		makecar = 1;
		lastarea = GameCont.area;
		lastsubarea = GameCont.subarea;
	}
	else if GameCont.area != 107 {
		lastarea = GameCont.area;
		lastsubarea = GameCont.subarea;
	}
	
	if "makecar" not in self makecar = 0;

	if instance_exists(Player) && (makecar = 1){
		if carspawnx = 0 {
			with(instance_nearest(x,y,Floor)) {
				other.carspawnx = x;
				other.carspawny = y;
			}
		}
		with(Wall) if (distance_to_point(other.x + (720 * other.carright),other.y) < 30){
			instance_create(other.x + (720 * other.carright),other.y,FloorExplo);
			instance_destroy();
		}
		instance_create(carspawnx + (720 * carright),carspawny,FloorExplo);
		with instance_create(x + (720 * carright),y,CustomProjectile){
			isshittypopocar = 1;
			
			sprite_index = global.spr_AuditorAcar;
			mask_index = global.msk_AuditorAcar;
			direction = 90 + (90 * other.carright);
			if direction = 0 image_yscale = -1;
			image_angle = direction + 180;
			
			speed = 12;
			
			team = other.team
			creator = other
			
			on_wall = script_ref_create(nothing);
			on_hit = script_ref_create(nothing);
		}
		makecar = 0;
	}

	with(CustomProjectile) if "isshittypopocar" in self{
		if other.cartime > 0 {
			other.cartime -= 1;
			speed = 12;
			with(hitme) if (distance_to_object(other) < 15) && (team != other.team){
					sprite_index = spr_hurt;
					image_index = 0;
					sound_play(snd_hurt);
					my_health -= GameCont.level * 10;
					motion_add(direction,4);
			}
			with instance_create(x + (10 * other.carright),y - 3,Smoke){
				team = other.team;
				creator = other;
			}
			with instance_create(x + (10 * other.carright) ,y + 5,Smoke){
				team = other.team;
				creator = other;
			}
		}
		else if speed > 0 speed -= 2;
		if speed < 0 speed = 0;
	
		with (Wall) if (distance_to_point(other.x,other.y) < 30) {
			instance_create(x,y,FloorExplo);
			instance_destroy();
		}
	
		if speed > 0 {
			with(Player){
				if ("recordedalpha" not in self) || (recordedalpha = 0){
					recordedalpha = image_alpha;
					recordedhealth = my_health;
				}

				if my_health < recordedhealth my_health = recordedhealth;
				else if my_health > recordedhealth recordedhealth = my_health;

				x = other.x;
				y = other.y;
				image_alpha = 0;
			}
		}
		else with(Player) if image_alpha = 0 image_alpha = recordedalpha;
	
		if (speed = 0) && (other.cartime = 0)&& (GameCont.rad >= 500){
			if (distance_to_object(Player) < 16){
				with(other) if button_pressed(index,"pick"){
					GameCont.rad -= 500;
					GameCont.area = 107;
					GameCont.subarea = 0;
					with instance_create(x,y,Portal){
						PstSLaunch1 = 1;
						PstSLaunch2 = 1;
					}
				}
			}
		}
	}

}
*/
/*
if button_pressed(index,"horn") && (global.ultra[1] = 1) && (GameCont.rad >= 500){
	GameCont.rad -= 500;
	with instance_create(x,y,PopoExplosion){team = other.team;}
	with instance_create(x,y,CarVenus2){
		spr_idle = global.spr_AuditorAcar;
		spr_hurt = global.spr_AuditorAcar;
		global.recup = 1;
		recupcar = 1
	}
}
if instance_exists(Portal) && (global.recup = 1){
	GameCont.area = 107;
	GameCont.subarea = 0;
	global.recup = 0;
}
*/

#define draw_cricle
with(instances_matching(Player, "race", "auditor")) {
	if (drawrad > 0){
		//draw_circle_colour(mouse_x[other.index], mouse_y[other.index], pushrad+2, player_get_color(other.index), player_get_color(other.index), 0.75)
		//draw_circle_colour(mouse_x[other.index], mouse_y[other.index], pushrad-2, player_get_color(other.index), player_get_color(other.index), 0.75)

		drawraddeg1 -= pushrad/15;
		drawraddeg2 += pushrad/7.5;
		
		drawradmul1 = floor(2 + (pushrad / 10));
		
		drawradofs1 = -(360/drawradmul1)
		repeat(drawradmul1){
			drawradofs1 += (360/drawradmul1)/2
			draw_sprite_ext(global.spr_AuditorArrow2, 1, atargetx+lengthdir_x(drawradexp, drawraddeg1+drawradofs1), atargety+lengthdir_y(drawradexp+1, drawraddeg1+drawradofs1), 1, 1, drawraddeg1+drawradofs1,player_get_color(index),drawrad);
			draw_sprite_ext(global.spr_AuditorArrow1, 1, atargetx+lengthdir_x(drawradexp, drawraddeg1+drawradofs1), atargety+lengthdir_y(drawradexp+1, drawraddeg1+drawradofs1), 1, 1, drawraddeg1+drawradofs1,c_white,drawrad);

			drawradofs1 += (360/drawradmul1)/2
			draw_sprite_ext(global.spr_AuditorArrowSmall, 1, atargetx+lengthdir_x(drawradexp+12, drawraddeg2+drawradofs1), atargety+lengthdir_y(drawradexp+12, drawraddeg2+drawradofs1), 1, 1, drawraddeg2+drawradofs1,player_get_color(index),drawrad);
		}
	}

	if ("fieldalp" in self) && (fieldalp > 0){
		drawraddeg3 -= pushrad/20;
		drawraddeg4 -= pushrad/5;

		drawradmul3 = floor(2 + (pushrad / 10));
		
		drawradofs12 = -(360/drawradmul3)
		repeat(drawradmul3){
			drawradofs12 += (360/drawradmul3)
			draw_sprite_ext(global.spr_AuditorArrowSmall, 1, fieldx+lengthdir_x(fieldrad, drawraddeg4+drawradofs12), fieldy+lengthdir_y(fieldrad, drawraddeg4+drawradofs12), 1, 1, drawraddeg4+drawradofs12,player_get_color(index),fieldalp/2);
			draw_sprite_ext(global.spr_AuditorArrowSmall, 1, fieldx+lengthdir_x(fieldrad, drawraddeg3+drawradofs12), fieldy+lengthdir_y(fieldrad, drawraddeg3+drawradofs12), 1, 1, drawraddeg3+drawradofs12,player_get_color(index),fieldalp);
		}
	}
	/*
	with(CustomProjectile) if "isshittypopocar" in self{
		if (speed = 0) && (other.cartime = 0)&& (GameCont.rad >= 500){
			if (distance_to_object(Player) < 16){
				draw_sprite(sprEPickup, 0, x, y-15);
				draw_text_nt(x-12, y-39, "CAR");
			}
		}
	}
	*/
}
#define nothing

#define race_ultra_take
global.ultra[argument0] = 1; // Confirm Which Ultra Was Taken
if(global.ultra[1] = 1){
	GameCont.PPCarMode = 2;
}
if(global.ultra[2] = 1){
	GameCont.PPCarMode = 1;
}
sound_play(sndBasicUltra);

///////////////////////////////////////////////////////////////////////////////////////////
#define race_name
return "AUDITOR";

#define race_text
return "REMOTE FORCE WHISTLE#PICKUPS GENERATE FORCE";

#define race_portrait
return global.spr_AuditorPort;

#define race_menu_button
sprite_index = global.spr_AuditorSlct;

#define race_mapicon
return global.spr_AuditorIcon;

#define race_ttip
return["HALT", "WHISTLING", "WHERE DID I PARK MY CAR"];

#define race_tb_text
return "FASTER WHISTLE CHARGING";

//#define race_ultra_button
//sprite_index = global.spr_ult[1];

#define race_ultra_name
switch(argument0){
case 1: return "JERRYCAN";
case 2: return "TRUNK KEYS";
default: return "";
}

#define race_ultra_text 
switch (argument0){
	case 1: return "ENTER LEVELS IN A CAR#WITH EXTRA FUEL";
	case 2: return "ENTER LEVELS IN A CAR#GET THE WEAPONS#OUT OF THE TRUNK";
}

#define race_ultra_button
	sprite_index = global.spr_ultport[argument0];

#define race_ultra_icon
	return global.spr_ulticon[argument0];