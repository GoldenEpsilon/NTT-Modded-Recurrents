#define init
//load the sprites in! im pretty sure YAL made a base64 plugin for paint.net to get this
global.spr_idle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAWgAAAAYCAYAAADXsGegAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAAd0SU1FB+EEFA4cEiRnBZAAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTZEaa/1AAADkUlEQVR4Xu2YMW4UURBEHZIiISQuQUhAQEQAxFzBJ+AGpETOibkJx0Jma+Ra9dTU9N/dsTxeq5Ce5nf97tf2rGUk33y6vQshhPAMsWEIIYT9sWEIIYT9sWEIIYT9sWEIIYT9sWEIIYT9sWEIIYT9sSE5/Ls/FTc/Qh0dbn6EOjrc/Ah1dLj5EerocPMj1NHh5keoo8PNj1BHh5sfoY4ONz9CHR1ufoQ6Otz8CHV0uPkR6uhw8yPU0eHmR6ijw80DGwIMvXvz/v7jh68T377/mOD5568/E8y6JY74e+Lvib/nKfynuvHc6q976K/7tvjxnjr3Fj8/g+pXN85r/kVAMJAf0HXi74m/5yX4T3XjudVf99Bf923x4z117i1+fgbVr26c1/yLgGAgP6DrxN8Tf89L8J/qxnOrv+6hv+7b4sd76txb/PwMql/dOK/5F8EUHpohpvzz37cTEFGO+svv18cM57UlSvw98ffE3/NU/lPdeJ7jB+jt3PUXHbJz3XBgDg79XtR9qd99Bs6NM2bcjlkxBYcmDHHBdP736ijjMmboQ4YnMrekEn/8NYv/+vx0c4au6p4QNxj5AXqq57HdmKELz/qemKkb2bn+c918zny1mIKHRggor/BFEfRxIWpdoMQff63jvz4/3ZwhIzcY+QF6qgc8plu/7rX3pH2X+M9xI9MdM/kxPDRBDKoMZ4IaOWsnXyP+nvh74u95Kj/nRm5wjh+g91Q3skvc9PB7gcftu9RfP4POjTNm3I5ZcQwPjZRzEH8nAZDhWf/A3S1woC/+ddAX/zroi38d9O3hX3PjyT7nU9AHd/266Kn+uo99zqegT/2d+1K/vh/61I0z+xauRfAg5xePYZ75vw5/8xNkuGefOiu4j9+7Ae7j926A+/i9G+A+fu8GuL8m/0w+BbIAZ8BFAOf62x8Z+3SBEn/88ce/Rvxz/0w+BUWKM4U4k3pPuBxndVZwH793A9zH790A9/F7N8B9/N4NcH9N/pl8Ch4EdXAxVHpqds43gOfaTO2pWfzLnprFv+ypWfzLnprFv+yp2R7+4+EYHBpqk9Zd7jJFe7Tucpcp2qN1l7tM0R6tu9xlivZo3eUuU7RH6y53maI9Wne5yxTt0brLXaZoj9Zd7jJFe7Tucpcp2qN1l7tM0R6tu9xlivZo3eUuU7RH6y53maI9Wne5zWoRQgjh+WDDEEII+2PDEEIIe3N38x+G+XnNJRI4RAAAAABJRU5ErkJggg==", 15, 12, 12);
global.spr_walk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAAd0SU1FB+EEFA4lKOzvUZgAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTZEaa/1AAACr0lEQVRoQ+2WMY4TQRBFNyRFWiFxCUKCDYgIgJgrrESKuAEpIticmJtwLLTwRv5WufynXWPPCK0ppKfu/q561dteATdv7h+a5mxs2DRVbNg0VWzYNFVs2DRVbNg0VWx4Lfz981jF9V87+Q1GuH6wociSEa7/FNkxwvWPoOfl7avHu9fvJz58/DKh/ddvPyeUnTujius/RXaMcP0j6FnjfY4CsdaAOdo/5qn4jwKx1oA52j/mqfiPArHWgDm29Mst/9tfLyain/O7H8/3GftzZtArZ/T/L+9zcNiHKw5wbOmnRr34p/3vZ/sZmqeMOvnJqjP6fXa+eJiClQdk/oU/Ir+Ifs7n+Le+/9b+iPwi+jln/4F8ClYekNnaD9TgFvSSAS7NkFv+qlu91/A+sZe9iG7VOPfBYR+uOMCR/ZxBLrjED5pBr9zxn4A1/w+x9fts5adPK+9wzvscBVMYBrCHygBwPge1zGCl/9Pn7xMjv1bny8ivHvagLyOix6+6ITrjHHD3p6bqH7nZz72Pcznkpy+6eYfR+1iXDXcDWOMFRwNU73yOOIMVRv5Y73wZ1evurPws7N0XEGudLxP9updmsOb7L707jopb/qobqMUrt7zCvc+c/yiYwt2AOCgOcQNU73yOOEN/87Af+VXjfBn51QO4tM9oBnvny1Anv/pYtc/3r949ep2bzL1PxS3kY83ueNbn4DxgQ1CjLqyzkytndS5H7OEXSGfnFpc8lM45U457iZ+6fN/8VpGqmxqcqhfZnWeD8zliPeslbhsKGvMPzl5ynYVqqtCTLxrdrn7uMwe12cc+nmNe/ZKBOufOv0DKq25qnHf0PQh9tgT6TrljfcaGkSzROWaXEF1xvwZLfUvq52qX5pm5Opcry/lSnMNlDhs2TRUbNk0VGzZNjYebP3JEFWBxc7paAAAAAElFTkSuQmCC", 6, 12, 12);
global.spr_hurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAYAAABZY7uwAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAAd0SU1FB+EEFA4zEa9ybEcAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTZEaa/1AAAB1UlEQVRYR+2UMU4DMRREU9IiISQuQUlBQUUB1FyBE3ADWqr01NyEM5EGhcxKE0/+jtc/wXSO9LTr8ffsn7/Kru5e1oMFrDgoWHFQsOKgYMVBwYqDghXB92azzeLOt9j9tlnc+RbRYwl3nljRDaGF86mBpq4urre3N48TT8+vE7x/e/+coNYKEenpb0U3gBbOp0bPAI6e/lZ0A2jhfGr0DODo6T8TXPgs0cvB5hng/utyQgNg/fBxvtdwvxRCif44q1640o8a7mv+BwsX+ljUL4ImGB4Bpvufs/2Q0KxqqNuH3Gm1EAT7DA//6ZygAwOo44C4nnnqwgU+FvWLoAEG54AUDoigjqGwdgEU7DPovwwIuNBZopeDzQPcAw6H6HBArXmH81cv9eOaddbPiS58FucXYUP6DdBvRPyIaljnF2FtD/+DBXChjyV6KmiCTfNNs1G8Wf69CDTUaBDnS1r+jiX/A3PgAp9C9CUaAFc2r2v3hhmCtc4b9PafPcCFPYXoS/BwNsSmcVV0v4bzBtjr6T97gAsLavt6NgMe7hqs7evZDPE8qe3rWcdMyITP1NRgg0vNZWpqZM5mashMyAb/y4BSjSXrItlz6TonDgpWHBSsOCDr1S/xV87l80PRIwAAAABJRU5ErkJggg==", 3, 12, 12)
global.spr_dead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAAd0SU1FB+EEFA4zAivMLZkAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTZEaa/1AAADBUlEQVRoQ+2VMW4WQQyFU9IiISQuQUlBQUUB1FyBE3ADWqr01NyEM5EGhXwrXvLWefOvd8UWoEH6NDMe+609dn6u3ny6nkwOE42TSZdonEy6RONk0iUaJ5Mu0TiZdIlG+Hlzc9slxW9x9++2S4rfompcIsVPekRjGpItks4Imvbi2cvb16/eL3z4+HlB+y9fvy/ItrfJZ+tPHojGNCBbJJ0RZzf4bP3JA9GYBmSLpDPi7Aafrf+/QN1dUjw8MqTh6FK1EiRDc9Xgtz+eL3iDOb/79vTexv5SEU7VJ9a1WKUnG/uuvpPeYESKv4Ry2kPSGYH/3/gjWx1S4XtxvQpJaDhIftn/enI/RCTqNvywLUNwZxsVIbjXcKC/xBn3Wn/AT4+jc9JNpNq3SDoJ5b+nwax78tc3uvoj7dUhFb0X16uQhAZDA+SQqJ/xw8bKeVSE4F6DcOYApbq7JL2K8v/nBghS0V2qVkKJA3vQ8AgfHtjT3KTvWq6ns/ySXiLV3iXpVchFNSjHrQazdmvAT98glvcA19IbyaaYR1rVAKnwLkmvomQ8OU++Po4PQ9KryPcs/VR3l6TnkAPN8wHqNNhtSVdUfWkL/x7gj01xVX8lDqnovVRNxxNSEXoEEtR/XwKbHpK1FlDZ0k/s0YdUc5ekJ/h2zcvPUOtQvdWW9EHfYE37kb77rvT8AKnoI1Rd4Qmxqrl+Tr8QarJ8kzacrQ+p3i5JT/BdNQnISXs1lPy0l2+yJX3BveplX99Ien5WLo+0qiEVfYSqK0hCDVOCrI7fj0jawN2Z+qnWvSRdwbfJTXl7c7VnVYOTLek6+PgbaO9a6Y8saa8OkAqG0b3HdqjJi9G9x3ao8WJ077Edav1HSLqi5ud7oV8ax++TroOP62po2CdtkbRXB+gU2vEZoeRTMqLjM6IT2/EZ4bUfJekK5ab8vLmXfiFYuzXpG6xAPOsl/ZH26gCdIqHrV1HS6c7p+lW6cV2/hGo/QtKrKLcjJL1EjesQdZJxMukSjZNJl2icTHpcX/0G9dQopiCcbZsAAAAASUVORK5CYII=", 6, 12, 12);
global.spr_slct = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAIAAAB8wupbAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwQAADsEBuJFr7QAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xNkRpr/UAAAEBSURBVDhPxZIxCsJAEEVTaimIYCsErFJaWFuoteBBvIGtV7D2Jh5L8E/eZHbdaNDK4RvdmfeSXUm1qJuf8hehyqoYKd7yeVvb6yTirbaSoMXmPlPWq50ynzYROkxxTNVCNyvQPBoJwLEapgmOC6pvBEdVbHHA0QjG6e1jFE6h0WEK5gJn0mx/OCnny03hN4KAJLAOgQ7JBTrpDLFXe2C3SUVNjfhttIrtppu1QtySx8K4oBZdBHPa9yIXYN4IClzQ+choXo/oxrVY6hqw0cvjOEeLv1VXATguKOy7L9CHeRE0Q8vPAMpIMbp/BqW/JWiD9fGjdFpfYOokX+F8Ksfq5gkqOvs5ybTErAAAAABJRU5ErkJggg==", 1, 0, 0);
global.spr_port = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAMAUExURQAAABkULjo2SUpUc2hxjUicEUTFFkj9CL79CIKLpgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALAOrMkAAAEAdFJOU////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////wBT9wclAAAACXBIWXMAAC4iAAAuIgGq4t2SAAAAGXRFWHRTb2Z0d2FyZQBwYWludC5uZXQgNC4wLjE2RGmv9QAADctJREFUeF7tnOt22zgMhBMndrfv/8BdzGB4FUWRuqQ6PZ4fsUSCwHwhITvenv3484/oDXI3vUHupjfI3fQGuZveIHfTG+RueoPcTW+Qu+kNcje9Qe6mN8jd9Aa5m94gd9Mb5G56g9xNb5C76Q1yN71B7qbzQT6a0uR1OrOCPK9KYdforOzyuiEFX6EzcsvlkLTkfB3OLIOlvk2/g76/v76+NAFp4ck6mFbegsyx3Bcyksfn46Gga0iOZJUvlzFQaScy2ThIwsZo/anan9Q9uZzBJe+FbNhBvn4zXinO1M6ctOMyi58kkOS9kM6WzX6TRFnO1K6cBKBo/fMTFoPkvZSNG0jcEuU5UztykgCSwwqk3yT3ASEC5L96WDeLeAnieCUbvvhszaYkg4mW3OHI2VKTXLglcynJEB5SBMGb3WCTXHu2ZlISImCYYLABstUk30iilOdpIiMp8reM4PAWTTKekRhLw7wafifhljCTsp6m0YQs/kEjUWvdvnW2+EFFeU/TYEJhNEAaTbJxtq5pkrGEkaPwS8PzINc0yVDCiGGiUyk4hEUOSK2zhfHQJFecrZF8OUcbZGBLsHNXnq2BfAXH8jfPq7kmueJsbecrOZYgoUnyGTqvZMOxSXC2lP4sbearOAoQGiaILAa1mgRx4r2iSbbSoeKHlU+iU4kOeTV3ti5oko10znE2yBVnawDk0yQIiEalotvzGTqvZMMAQdgFZ6ufLXB0QVrdvtYk152tbrbIkYMUJMFg3e1bTXL+A3gLxDm6ILub5FSSXjLUmgHJZ1pnC+PIZC8OEqR6h7QBIo5VkNVuJ+L38/X6BTnWokkyqeR+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", 1, 35, 230);
global.spr_icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAAd0SU1FB+EFEQYeHhtKowMAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTZEaa/1AAAA0UlEQVQ4T72RIQ4CMRBFK7EYjoJAoBCA5gqcgBtgUevR3IRjEeif9JNpZ1p2KUG8dPs7/6XNhvVx+Clu2IMb9uCHITzH4HZNEAdXy52wP5zenC83Ad8896T5JslYagm5llIjpGCMEPxfuH3MTGlzX0heCpFVhSK7zmUIsAQZhYBCnWmpFUYwrIU6z4QpqwopZQkroNA8OWbsVYUc1kLQ+imukFLehuBJHjzXMnFkm4k3xPpRCHSJeELOZ45skwamkjn0RgKn0ML0y6AXN/yeIbwAeZxQyyZOppEAAAAASUVORK5CYII=", 1, 10, 10);
global.spr_ult[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwQAADsEBuJFr7QAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xNkRpr/UAAAFISURBVEhL7ZMxTgNBEAQREe+wIHVAigQpGd8g5SF+Al8gtyz5Zwhmt/Z652bWvuNiRq3T3HR32UjmZvew99o/Pq9UKHZQyK2U6g0U7D+pg4KxQQWkCd5KtbLN+8cB8RpyV0S+159e3pBwoTCUEKp3UHtfDYrFvk3j02Gylevtq7aXOgphBTdevo4nk4+qn+Vj2iEUkE7YoTyUwmgGMts8b/tmEElbSA5ACtlwx0LNmGL2JNBByrFg18psuOdwAWFnD9v0U4edew4Xyuv3nU7bQA1y+3kv1gaQPRshgFgWQUras4P8Feh1kGIiClJOM3xlUa5+/wew3f8RYpUx+xLIFns918slEMf4O9KX9B2xWmeKCVQ+MoAYuwgklr8zCyA8FWCxc/dJwgOQvGa7ITkML4PEYueewyWGnT1sU/4d5bBZ/6Al0PH0CxNnwykeD+d2AAAAAElFTkSuQmCC", 1, 12, 16);
global.spr_ult[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwQAADsEBuJFr7QAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xNkRpr/UAAAE6SURBVEhLzZGxSgNBFEWDhaRLY2UjSIKNREgrGNDGLo2fYGFrZ+cX+AWSX0gfBEv/KujducOdx+M5O1kVfBw2bzb3nmyS0elsbpkvrhpxxSJyuUZUzyL39l4UkXtjAL8qcrcGE4tGzVMq2gQTd9fn4vn+JiQWsc+R4nUyBdyfDk8A9x4RQxZZiEQkEHWPEYk+ji6Ajs7LVhHxjFmcHYfYsiXXkitvD48vuLp+LyrmuVyu7Pl2N37fjRsXFFHH0lkoImG6V9S58ouZg/UUucYF40W48okQAo0L5lvRvhOLeGwnEA2evxEBfC+x2b6JzzT2jk2qHouAak7kYqoXEbAJNSsi2/2HIv3swIbUbBGlfy/NT0RFocWG1KyL1M3PwrMNqVkRsZUNfJGLUxflUJpS1+Y+pz4K5/py9QX9gnklGwNZVAAAAABJRU5ErkJggg==", 1, 12, 16);
global.spr_ulticon[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xNkRpr/UAAAC5SURBVDhPvZHBCYNQEEQ/OaUCK0gpOdiAJ2vJJee0kEoCXgS7ktU1DMwuY74HifDAdWcefi1mJrlPjSlyDoSBC2VdKTjD3SDhwuP5knCGZUHSdn2VLIVMvs0vac5JkQfVERjsIa2KPsO4gQvzIRGoiTgrRZf3zdr5ut2jiALPnNsVOSjmEj9DTooAjpZL/uzQ0dTHRgEz9v/5a6eJmD1RzgWRo2Q1IAkixxdAFR3OcDeIGC4wOffFygKzl8AaAj7KiAAAAABJRU5ErkJggg==", 1, 8, 8);
global.spr_ulticon[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwQAADsEBuJFr7QAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xNkRpr/UAAACaSURBVDhPY/j//z9VMFZBZOxyTOw/IQxSh1UzCMMUMQCV4MMYBsE0ohuwe99hnBjDIGSNMFzb1IMTEzQIm6bZ/CpgDGJXsMmDMUyOZIOQ+WQbdExEH4xhfGSDcRrkERoNxzDF+DBRBhGDcRqEjJnmqhBFYxiEjEEKPP5yEEWjGISMqW4QKV4DYiALh0HEYvoYRAbGNIg8/J8BAC4hu4URd/HEAAAAAElFTkSuQmCC", 1, 8, 8);
global.spr_defmount = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTZEaa/1AAABMUlEQVRIS92SPU4DMRSEt4QSCSFxA6qUFKlTLKmROAg3SMsVUnOTHCvaZN7LZ9mO114nDWKkkbX2/Hjf7vCXMGW8G0nguH9KmJ+f2YVpc3gxrt8/jK/Pq4Tso5PHrW2YQbcsBeeURtqeksXhkBJ5PaIOE/YW4FNAC2GuS0qkQS+vR8zDhOPxISkpFbGPDo8yPKqMIObDKWT7+W3c/fwaeaZA2q4CTHEB+zAvYF8ZHjWPII5nbG8VjU7UmTQ8y+sRdYQ5J7e8FMS35e3Qy+sRdZgRMwVWolkXCtDL6xF1BENsJjQOzzXyekQbiTleS3ta5XFrG2Z4+3q8Ci79plql7SkxscjM5wo4Ry+vR9QRDAqhKP8GBKMR5fWINhIzN54bUW84MFOrAJ0MtyIOKfFfYxhOlE0Jk+4sbLAAAAAASUVORK5CYII=", 1, 12, 12);
global.spr_defmounthurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAYAAABZY7uwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTZEaa/1AAACA0lEQVRYR+2VMU4DMRREU0KJhJC4ARUlBTUFUCNxEG5AyxWouQnHQoH5nrHsxfmxvfu7POlrFe+f0cxulOxObMR+AY+3BJ7lbM22/nwO3VA2QhX48fOimuX9vxml0m/qz87DUN7D/uH7yub+7snm+vK2Gp1rD5ok7SLOn12noY2HBcJbbAVfDnawO1Ai1p89p6GNR3d4jUpAmyxcYv3ZcxraeFiQ0QLSweAIsf7sOQ1tPOzrjOkpgR3tQ5ssXOL82XE1tGthQR5/zqoSrSI615408EhWTapdzKb+7Lca2rXIYfTDiJDPL2827x9fNvqsAtgdfUAh/uy3Gtq1sBAKVRbQuWZZQOfwSFZN8l6Q//qHRBuPHEZfdQuJt863qME97OgztMnCJe+H+LPnNLTxsFCY6i2yQPk2cQ872oc2WbjE+rPnNLTxsGAKpwJW4i98q4D2oU0WLnk/xJ89p6GNRw5UhlPoMvxyB9pk4dLUbug//5Ao76EKV15bZ7hCk6RdND1wbZ3hCk2SHoFdp6GNhwW6eT3/F7z1N4wrdgdKxPqz5zS08bAwGP0mHCqg+9qHNlm4xPqz5zS08ciBEFJFlr8RCq4dDLTJwiXvB/nPPyTKe6jC4YpZvuFyB5ok7SLaf/whUTaChTpWQHsQDBLtn2D/g3BtDWXI1qyl5VnOiRNh7Ha/ITTekT81PVwAAAAASUVORK5CYII=", 3, 12, 12);

#define game_start
//Make sure that the ultras don't stick
global.ultra[1] = 0;
global.ultra[2] = 0;
//Confirm sound
sound_play(sndMutant8Cnfm);

//Passive (More firerate the more you fire)
while(true) {
	DefectHeldWep = wep;
	wait 1
	if wep = DefectHeldWep {
		if (((weapon_get_auto(wep) = 0 && button_pressed(index, "fire") or clicked) or (weapon_get_auto(wep) = 1 && button_check(index, "fire"))) && (can_shoot = 1) && (ammo[weapon_get_type(wep)] >= weapon_get_cost(wep)) && (!instance_exists(menubutton)) && (!instance_exists(GenCont))) {
			//ultra B
			if global.ultra[2] = 1 {
				if DefectPewPew < 3 {
					DefectPewPew = DefectPewPew + 0.04
				}
			}
			else {	
				if DefectPewPew < 1.5 {
					DefectPewPew = DefectPewPew + 0.01
				}
			}
			DefectPewTimer = reload + 45
			wait 1
			reload = reload / DefectPewPew
		}
	}
	else {
		DefectPewPew = 1
	}
	//if you wait too long to shoot again, lose the Pew Pew
	if DefectPewTimer > 0 {
		DefectPewTimer = DefectPewTimer - 1
	}
	else {
		DefectPewPew = 1
	}
}

#define race_soundbank
//It makes Robit's sounds
return 8;

//Sprites for the menus
#define race_portrait
return global.spr_port;

#define race_mapicon
return global.spr_icon;

#define race_menu_button
sprite_index = global.spr_slct;

//UI stuff
#define race_name
return "defect";

#define race_text
return "constant fire gets faster#can @smount @win place";

#define swep
return 1;

#define race_tb_text
return "@wmounting @smakes your#projectiles even faster";

#define race_ultra_button
sprite_index = global.spr_ult[argument0];

#define race_ultra_icon
return global.spr_ulticon[argument0];

#define race_ultra_name
switch(argument0){ //Ultra names
	case 1: return "tank";
	case 2: return "module replacement";
}

#define race_ultra_text 
switch (argument0){ //Ultra text
	case 1: return "gain a shield while @wmounted"; //Less damage, nice.
	case 2: return "get to a higher max#@wrate of fire @sfaster"; //More outgoing damage is also nice.
}

#define race_ultra_take
//Make sure you recieve the ultras
global.ultra[argument0] = 1;

#define race_ttip
return["incorrect", "goodbye", "stuck here", "sirens", "left to die"]; //loading screen text

#define create
//Sprite setting
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_dead;

//Set passive variables
DefectPewPew = 1;
DefectPewTimer = 0;

//Set active variable
isMounted = false;

#define step

//Active (Mount, gaining more firerate, shot speed, and accuracy)
if (button_pressed(index, "spec") && !instance_exists(menubutton) && !instance_exists(GenCont)) {
	//mount ability (not the functionality)
	if (isMounted) {
		isMounted = false
		maxspeed = PreSpeed
		accuracy = PreAccuracy
		spr_idle = global.spr_idle
		spr_walk = global.spr_walk
		spr_hurt = global.spr_hurt
		sound_play(sndHitMetal)
	}
	else {
		PreSpeed = maxspeed;
		PreAccuracy = accuracy;
		ApplyMountAccuracy = true;
		wait 1
		isMounted = true
		spr_idle = global.spr_defmount
		spr_walk = global.spr_defmount
		spr_hurt = global.spr_defmounthurt
		sound_play(sndHitMetal)
	}
}
//mount functionality
if (isMounted) {
	maxspeed = 0
	//damage bonus
	with instances_matching(projectile, "creator", self) {
		if ("AppliedMountDamage" not in self) {
			damage = damage * 1.1
			AppliedMountDamage = 1;
		}
	}
	//accuracy bonus
	if (ApplyMountAccuracy) {
		accuracy = accuracy / 2
		ApplyMountAccuracy = false
	}
	//shot speed bonus
	with instances_matching(projectile, "creator", self) {
		if ("AppliedMountShotSpeed" not in self) {
			if skill_get(5) {
				speed = speed * 1.5
			}
			else {
				speed = speed * 1.1
			}
			AppliedMountShotSpeed = 1;
		}
	}
	//ultra A
	if global.ultra[1] = 1 {
		with instance_create(x, y, EnergyShank) {
			damage = 0
			team = 2
			speed = 0
			image_xscale = 0.5
			image_yscale = 2
			mask_xscale = 0.5
			mask_yscale = 2
			image_angle = other.gunangle
			mask_angle = other.gunangle
		}
	}
}