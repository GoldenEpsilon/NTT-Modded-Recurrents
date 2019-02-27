// When Mod is First Loaded:
#define init


 // Define Sprites Using Base64, sprite_add_base64("Base64", # of Frames, XOffset, YOffset);
global.spr_idle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAPAAAAAYCAYAAADEQnB9AAADdElEQVR4nO2cv28TMRTHvyYdms6R2EAIaIoydEQdkVqV4SLYigRLGVi79I9gpKJdsjB16EJV9cTSSGWje6mUVEHiD8gMXcJjOJzeL/vOd/FdLN5XilQ7l8/z63vPvvjcCiICi8VyU3fqHgBLLSEECSESM2xaH/Nnz6/bRh4t5IEDABGJeH+8r4hc5ttmr++0I3akPL+b6DO1x/z5stHfGyb6iUiockxKW8CuB8Emv4rg9veGWN9pQ9qRfWE7AOB7p6Zo5s+RDalwzsgc8vyuli1034ElMDx4IHBAgsMOFCkwV/k22OEAhrmLG8sAgJuz60hbsoF8EwTzs1WVD+HVNSuHdPmTKGDXg2CTX8XY07h5lGeSYP78xECu7HE7pjmUWsAuB8Emv8oEMmGb2GB+vTEom0NAtJAT34Hl0l7EAXnfrnPAZb7tsceDa6osG8yvPwZlc0iOUfITj5Fm5YDqfZf5tscuVWRWNhHz67NRNofiUu5CmzogZ4e8cplve+wAcLLyDi8GvenPaZLvF7HB/HptzCqHtI+RXA+CTb5N9s3ZNbBya6fxKPjsZBTM9LItmes7baNVgPnzYcM0h9KkLGDXg2CTb4sdfrSwid3pLE1EuPv2J4DvkbbvPYjsZGZt0DA/ewOrChtAsRzq7w0TfOUmli0HXOZXFdzDZgfoAZ9wG+S11XsYjr8CAJ48DNon/65f3FgGYid5mF+cb9NG0RxS8ZVnoQ+bHWz3FqbPpW4dGGM4Hk/bUqY7ai7zbbKJSLz+fQUA2O4F8+ufHz4+e1/QbrXQbrWmbQCJI3jML8evyoZJDun4ypNYQgg6bHYAAK8u3ysB4aXe5DSTy/wq2EvnR/j1bAtbq1fKaxcuojM688vzq7YBZOeQjp/6HTjuAL3Rb8CEDZgM3kW+7bHL648BLJ0fofG0g8laNCca3whCiGkwTY6AMr9+G6Y5pONrV+Dji+B+/GUOB0zlMr+KsT9+Htw+3W83AQBnHwbxa2bGj7P/d34VNmaVQ9oCjidRXPLevGgRMD+bP9g/AABsftxN5ZctgsH+QSqb+fl+/0DN+UNEyhcAmoxOaTI6JQCJl+zXMZhvh1+Wzfz5jm9efqYBz+8mIKr+Ig4wn/nML87P9ffAFFvCTXfcmM985tvhawuYxWLNt/if2rFYDosLmMVyWH8Bo/aA2ycrNeIAAAAASUVORK5CYII=",10,12,12);
global.spr_walk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAAEnklEQVRoge2aQWgbRxSGv4l8iHoWscFgUxJbKjrkmAYKoSATt8g45JJCSsGF+NIa5WAKORQCPaQUX0Sdi3IIFHToJcVYBBsb2kDB7rG0ActpSQkUGtC59aHJ9CDPala7o92Z1cpW0Q8LmtnZ97/5582bmdUKKSUjjOCKMyftgBBCCiECURxW10/7w4K09UmKsagGylEppeiu766zhRBClip5H49CubEQqLPlU/Z3q81AvZRSmPpmyxFmYxj00e26+tozgAbRgd1qk1Ilj+JRdToPQKO8aWvaB91X5Xu5sZDI7rDr048JFpmB+t0BXVTd5tm5WQCOdg69elfbeue7ebrFSoph0icur80ECwTQIDoQZtdU1nniLAulSt6XGaJ8j2tXb9urH6dZnzQmmOg+hZnEj4NGeTNWmlYcNrbjcCT1HaKXmf+DPiprKujBr5eVPTDrEshAKjpdOqBSX9Qs0J23RS+OpL4r/3r5P8z6KCj7ttkNgoEUOMb3qwNR7VyyQxSS+j4IjpPUR0op1BLlEvxhvhvfA6XRgW5sFJZ9v8MuF45B+D4IDojWyIYjjQnW8xS2UVhm8aDm/Q6Dut8ob/o2plE42jmEQocnc6H97Kvf2kKosrJZquStBsLWd1dE8STRRw9Sk0Yu+tgGfy+/jQGU1gDrJ4CrrHqdkVIy/vEfwK++cqP8pm/DF2cT6uL7brVp9Z4mrQHW9SkBi9T0ez6Nzi09d9JH9zlu8Jtg3ERDegMMUM8WoQYP6Qz25YtTNFs/APDW+XZ547j92blZiDhiuvoex3YYR5oD7NMHQjWy1UfBJfhNE8y4B6pniyzVxryjXcf5Fs1Wyysr2KRFKaW4+c9TAJZq7Rh+/XuDR+XH5HM58rmcVwb7dxM2vru+WNQ5TDz90sekka0+ahO9W21ytHPoZZjje5xbeu6V28G/SdRpM/AeyLshhKxniwB88MuXRgP6cmDznqOeLfLG99/y97s3uHHxqbHt2L5/1tvYj+O7639iOkcvntOmj+73w+V/AdheWePM+TLXqq+59/Y3ANzZ/4iN25lI30MDKK0OdB8BZ+an+OruY65dKvLqsv+xzJ5k9r1pDtbvewNtdMLR9/lL9nsfWw6XCaA4ZuY7Gexg/T4A8sPOhnZsv93U9pMcm+CP8r1nBvpuv72W9xrgZ1svrEQpVfLUr6+Sm5yg8OknTOezxvb166sA3Hy0ZjXQuvjT+SxbP/lTfGZPMne7wPbKmlVwdnMofT67+77XD50rsycRQjj/060G7uWTBwDkJifadi94QSSgvfzY2LQN/p72TBlIHwATXGevEuSde18A8GzrRaxnXQP16tergTbbK2sAtP78i/Ert5yDaGZ+ytNI8S0e1Giu/2w1uaJ4wP/fWtJPUNT4/njncy8wXbKbMYBePnlAbnJCj/YAks6sJDai7KsAAhi/ciu0nQpk1wBSXCbbSexGcfXjWyPwZ7eusY63NEopAxcgy40F2b4dvD8MFyDVNcg+ArJUyQ+FdkqfcmPBWQtjBjoOrr5nh9OCtPo4jNolyWzWO/gRRtBx4h/VjzDcGAXQCInwH74lnWmwCUR1AAAAAElFTkSuQmCC",6,12,12);
global.spr_hurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAYAAABZY7uwAAACU0lEQVRYhe1YPU8bMRh+3gtDwz9ggSGFIAWJsWKslKodfOoIlVgYylZlYeAPIHXo0pWpCwMTQuelohJjxdyhDQr/IHPFEt4OqQ/fxXe2wYkjwSNZufPZz716/H5diJnxjGoksQ2Yd7gIxP+Haf7RICImogku01wM/gXLc664rpojl5fmi4m422vn1/ozIdOJOWaeOX/0EPvxtQ8A6Pba+dAhZAoh02j8ZEjSj3Ft6wnrp6Yb++LNGgDg9uK6cA8AUmRjwxw8KDR/aIEAi0i62wNFQ22QIrOKFJrfFGJecW5ArcDMTMrtfYwHzHlj2vwmgUJUj0qO8gn7wiZSaP5oSbp8ulJkeS4o3+vzs+a3lfmp4nx9H+//HKvYBwDc3cjxw8E+AKDxclxhpMi8q5nOPxqURHDkj+ZBqpoAgF4okpbIf5OWyI3u9toTXuDKPxpkSFoCS0cbhfckH1Mrv8mDCFMs9cxMKsbf4sCaSKXICuXaVsVC80fzoJNmB3vHC7i9uL4PKwC/r76hPxxOrPetSDq/wtbmMvrD4T3/h0Mrv6kPUnioFzm1CUTEJ80OAGDn1+fKdSpHCJk69UGh+auStK84XmGpjF+8PMXf19vg3frkq4fNrPmrBHpIHnJuMJVBZwAWL0/ReNXBaKu4vfGTQUSFPTH4Q4aY95f26rtlAMBKu2lc8/3TF70NiMJfJxDgJ5L3JwoRsepPVC6oNMRToGD8zFw3dOTzHvtrBwAWMuUxzXzyu3pQQd1S7Nbtr4VKjOXTmyd+m0BPHtH/UZx3PAtkwT+xfCjkRYvJBwAAAABJRU5ErkJggg==",3,12,12); // Hurt Sprite Must Always Be At Least 3+ Frames
global.spr_dead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAADbklEQVRoge2aPWvbQBjHfy6Frv0AXVvTraHQBkqh6eAsXdwPYNrkQ0ghs4n7IRxl6Np4yZLFLoRAFCjOZpIpnyB4CmS6DtadT7LeTpYi0d4fjE9n+/+c7nm553lksLCwsKgLrbhJIYRQX2i1WtHrEuQKbdyKuW46v0WAJ9EJ3VjyXBeA8D2H+WzMfDYGEHLsew6Eld1EfgsNKwaUB+saUXtzO2u+0fwWSxQyICglEgHg9jpcX5yq62F/h2F/B0pSctX8/ztW8gFTwyiQEwkA33MYTaZqsru1AcCzVx8B+PP7mN39w9g11sxvoSG0eUWjioERiSAvAeD64lQdK4ODAe6ey+3dPbBQMGCq5Kr5LSJ4Wqfw0WRKN+Gzt5++BqPDxvJbRCAKwkTEfDYW89lYuL2O8D1HcfieI9xeR1ydn4hhf0ewOIrkqyn8/yoK78PaORAY50EiKKd5920Q+uDyyFU5ypsPX1LXWSN/WFiwXyX1x2JFBO+V8ctj//nrz/p8LnmFq7DQCgyNLqnMhmVucnV+wtX5iRLRJH71I+2+14zMiSL0flbMq1RE+2d55JSWAwkhhIkXLiokV0WJyyOX0WTKy/YL9Z2HmzM07xAYeGHV/HlQZgdfRlXdOYI1KxGmy5ODwcEyUrsBf9DqAGB3/zBxb2pJomVfRipZjt29xfj27p6Hm7PUSFInf5HoYuhgscqVrQiJvEqO4/c9Z6VClePu1oZWZMCwn8xfiwHJ/oxcNACTaegM9j0nVIY3hX+doymnESUqFxbOMZpMjZScBd0wu1sbtDe3VbsDZMUaX61mPkzNC9NEWu/XRDcJFgmd7zm8//5DiWgC/7q5jakBxRm5nNOVDKowyOSfz8ah7rzOb8pdmgGBWUMRFlEgKQLIUCoRKLpW/jIS44w9SlUuLI/ngga00mjVu/W6k+ncaV37RGGPGYUi5WOqiLr4y3r2l7JHqcrVjV2PToaPZkL34PY66sjS5bY3t/l1/FPyhZafOaEkRTasgj5HVMGN5n8MA9IvpHIhPgrJuRjnMHIyXR4QMqjri1P9iI/lzh2yK2qUiflsXJUBVcq/jkHl3EvFHz2K0/IXw6NeyZLOZsqdKehf6LRWzP9o/2CA1X5QTJSAYve6kjfm4bZPoUtGnDGV7Hxxxlolv7URCwuLhuIvw/sHUF+PrPAAAAAASUVORK5CYII=",6,12,12);
global.spr_gosit = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4QkHAgctiBEmkwAAAZpJREFUSMfNVjFPwkAU/h50kF9gHKgOYkkcCCM7JAwlsjk44eDa36KjJG7OhrSDCS5M6i4DyKBuJOywNM+B3Fmud0drJPElL2lfr+/r+7737krMjF1aATs2KwARMRGxLp4VwLElbwaeNqEfdVIxZqbcFTxdTwAAzcCTrgL5UcdaASVFTn5VMtle6wQAsBpON+4BIPJDawUpAF3iLBb5oRakoPIoaMmT3KRLCkCtIK/pQLQi56XmV3MwqF79CYh2DlbDKVDdfDnZjmqsGXhGEEcVWXB41roVMexffmBQfZPrDno3mN8dgYg22nlrF6mLRN83ai4mi4X0Rs3NrBmpuykR8X3pFABwsRwjnpn5LR53JFWmOdACAIAAOa+NzQK+rCkkIiNFju3rBXjcSO8CxWfGw+sYRGTcJqSISQfAwittl21Wabu8TsEwOelONCLiSvtHyEOvlFrzOVnK6/fHL3MVOlQAPB/1OZ6FXO+WOVmV8Hq3zPEs5Pmob63CMYDKeah3yykBxTPRRTYNaNuhL5LpAKziZgX4938V335VOczq3U8pAAAAAElFTkSuQmCC",1,24,24);
global.spr_sit = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4QkHAgctiBEmkwAAAZpJREFUSMfNVjFPwkAU/h50kF9gHKgOYkkcCCM7JAwlsjk44eDa36KjJG7OhrSDCS5M6i4DyKBuJOywNM+B3Fmud0drJPElL2lfr+/r+7737krMjF1aATs2KwARMRGxLp4VwLElbwaeNqEfdVIxZqbcFTxdTwAAzcCTrgL5UcdaASVFTn5VMtle6wQAsBpON+4BIPJDawUpAF3iLBb5oRakoPIoaMmT3KRLCkCtIK/pQLQi56XmV3MwqF79CYh2DlbDKVDdfDnZjmqsGXhGEEcVWXB41roVMexffmBQfZPrDno3mN8dgYg22nlrF6mLRN83ai4mi4X0Rs3NrBmpuykR8X3pFABwsRwjnpn5LR53JFWmOdACAIAAOa+NzQK+rCkkIiNFju3rBXjcSO8CxWfGw+sYRGTcJqSISQfAwittl21Wabu8TsEwOelONCLiSvtHyEOvlFrzOVnK6/fHL3MVOlQAPB/1OZ6FXO+WOVmV8Hq3zPEs5Pmob63CMYDKeah3yykBxTPRRTYNaNuhL5LpAKziZgX4938V335VOczq3U8pAAAAAElFTkSuQmCC",1,11,11);
global.spr_port = sprite_add_base64("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",1,40,243);
global.spr_icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAABYUlEQVQ4jc2UrW6DUBzFz5Y9QJ9ipI4GAQmmrSgGAw/QhNTOw1K9JbzCkhUzu2JmMDCzBUTDRBNSN1XTZKmavRWD23vpBbpkYkfdz9//nNwP4I91ccYa8pv1l12wLHCxL2JkgVuHC9VWkWSBC0kz6ECvP+7cK3JImpxUbvdF3Oi2DuQihklOJzZpJNp/AmVtn0TcpBHCJId369H+eruj87P5os7AlahsJUkzYJXt5+UTlKEN5fo4/3gHzOYLwkK5yGGSc9HYtjK0IesmZN3Ew/1NowkuMgB40wkAwBoNOKefX9+QdZOOfby9AEA1JnbISnV8qI7Pua4glVavy1aHAEC86QTWaEAPh4293u6gDG0KKw+l3WEF26QRev0xJM2A6vicqxqMU2tkVpJmYPUeA0AdxqU8AbKg8kXQgxKo87Mg+LngZF/EJAtcro/js2x8nqIKnT9Km7smy13Qc/7Rf6oDPtKXxFitgLwAAAAASUVORK5CYII=",1,10,10);
global.spr_idleb = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAPAAAAAYCAYAAADEQnB9AAAEAElEQVR4nO2cT0hUQRzHv2MdPOVlS7wIUbR6SAO9hBdJRYI10UPQdYOgS3bo1kGC9lYHgwgCPQThzQqXOmghhNDFgxbSSkHqQQovXsRLTofXPOf9mbc7896sO/X7wsLOb3c/3/nt/Oa9t+/NW8Y5B4lEclNNx92B/1GMsVrfxxljkS1sXIz46fgqT1MPHak8atHJWuAAwDln4Xg4ZiKX+bbZgxP5gI9QoTwSien6Eb+xPBanKpE455ypakwocQK7Pgg2+fUY3MWpCgYn8hA+Iib7AEC5MK+LJn4DeQjJNSNqqFAeSWSzpN/AAih3HvASEGA5AZMJ5io/DZsxhrjvXR5Amds8dAEAcLCwEWgLNgDip+SLWFYeKsl71FprKKk2IxO4Xgm4yK9HgcZxa5E8yMTX58sTOAsPleRD5izqM3YC1yMBF/m2C1T20GGHPYivz5djWXioXk9bQ0BwIkd+A4tdu0kC4rg9KQGX+bb7Hh5cXUm/veMPt4ifyM/Sw1YNiT4KfuQyUoZfUqxc5tvuu5DJVllHxD8+j7Q1FJbyLLRuAmLrUKtc5tvuOwC86biF0a/P/edxEq+beBD/eD2yqqHEy0iuD4JNvk32wcIG0HHkc+K899nf37wtvWgL5uBEXmsvQPzG8NCtoTgpJ7Drg2CTb4stX1oYxj1/K805R2vxB4AvgXa5cDZwJlM+SUZ8fX6WHtVkUkOLU5UIX3kSy1YCLvPrUUAAMF0qAgBmF5b9Qb7c3Y7K7hIAoPOc175WKmL217LXj9BKHuKb8216mNaQiq9cCz1dKuLGmT7/utRRAruo7O76bZGo7hk1l/m2+w4APf3jeHT9MQDg8HsZc4W3yOdyyOdyfrunfzyyBI/42fBte+jUUBI/diUWY4xPl4ro6R8HAFxsVZ84/fyT4VJfoeqKkX+FnwW72nXOrqYWvPj40o89GbqNkQ/v/Pb8lau4s/AMK0tzuHl/xo8T35wfvg6c1iNJJjWk4isnsO0EXOXXoUABgHc1tfix3uZTET4AzOxvx6/OIb42P24Cy9L1SJJhDXmJh/utmMBAyi+pSgLO8m0WEAB/OZ/g9zafwuZwETtbqyg9fejzZ/a3/Y+q+ip7JPE/dfYAAPGll8Lja+JhcyPks6odqoQTkLW+8lp01Og2KuIns9cO9zAwNgkA2NlaDbynrb0b7189AKrckEJ8Iz4AcABW+HIOQLr6qXo/8OnRu9gEsO51NqCBsUmRhLGIH9Tf4mFrh3uBqhCDKdTW3q3bVeLXzge8varvkRU/rNT1wzlXPgDwQnmEe2+rHtd9EJ/4xE/Hr+l+YB7zjxNxcV0Rn/jET8c3On4nkUiNIfpTOxLJYdEEJpEc1h92eg84oF8YKAAAAABJRU5ErkJggg==",10,12,12);
global.spr_walkb = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAAFmklEQVRoge2aT2gcVRzHP5P2UC8WIU2Jh4ViMW2sWcsWtMRDKilBmMUkgtBjW1Q0h1x62xQtbW8qxKIHpSUURHJo0pKlHtJqoXroocpWqyao/SMoShA8KDm0HQ+TN/nNzHsz83Zntqn0CwPz3tv5/n6/7+83b968HcfzPIqE4ziF8rcDRWv0IGN9O42ZEuE4jrcy7kT7o32aaxO5m8VaKfxWtGkHUguo6AAcx/EGx3tCthTcejXWZ2vT5H9eKFKforWRvM36mlhA7QgA4MLkAoPjPShbqk/aAqi7c1a8yn/Jpfo9z3NaFa8d+hSlDeSjT+oMVEQAUljJu2HvkwAszy8G/a0IZLKpkuvWqy3z5q3P/dAmatdGn1gBtSsAHbepLW0lPRrkHWOKI3q32aId+hShjfQ9T32c6OJTTssmh02ou3O6tUBwLm0pOzb8OjtyES2nZFNyozGp5Nr6HeW29TsJeWlj4s1Dn4BT9/aSZwC6RMgkNGND2tEVkIJtcld4QoUp/VYoKsGSG1rXJonblt9USB1pRmyhWzya0EwASfA8z1FTsK34br2ayfd26ZO3NlCMPsZFtG0A6jlsi3PbXuOlHz8KznVQ42l2Wk2uDdaKPlm1gWL0SXwLyzO5OizPL8K2VVvrtvrX3/3Jv6NUW/EOjvdkutvalVzIN8ESy/OLoThM+thqA/nqYyygopILq28BJ48fYOjEoSAgz/PYfOAm8F2oXXe3hBZ9WRaitsVvi6ISLLWhAVONWSgHYyF9uvbfYKRxlGVLbaTPWYvfhNgaSD0n93X1M3TikOyna/+NWLvuzsWSaxPEvq7+YPUPsLtcYmFpiYWlpaB98vgBIPudI/lUYlVygVhb+Z/Fd6nPSGMTU9OzciykkZ/gTVb6yMV7ZWCUysAoxx57PeiT+uwul6gMjAJ2s4rUB8waKSTpEysgiSKSC+G9lMrAKO+88i4A936uM+Oep6ezk57OzqAN2fcnVHKTEqvaKrmt+F5EggEmD5/h6qWZUF9UHxttlN9Kn+X5xWCGAX3xq8khyXftRmJfx0ZgRSBGAW/FeYBOEQxMTftOuZYC9XVsZPLwGU5f9gV+te9Nqp9/BsDws08BcPbKdf66+B4Ha6dim19JvKu+A/iX+Im9BMD2J/w2/7Tm+/hRggIBYhrNuOf59g+nKRvgF9GuDfNBW+kjMdK/w1ob8CcHGvDpn18FSxWp0e5yiXOk66PdSFSGTl/+BID3976hTe6Wuzd5pt8NBZC2Iad+p2zs2vAogJa/NjYBQHepzMXZI6a9jRC3zvePr32oDX5qepaDtVPSv8T9q6g+0n9TDCPP7UjURxOPlv/WkD/TX5h5O8SNYS8viXf86Muhwn96s/76dVurqb4bNxL7OjYak6sCmHvhRU79+2vaxlhwLjf7fvtyO+u/+QKAOzv3GANXePz5H7gwuWAsULlJqfNd+n/2ynUAamMTfH/1bGJhSm4xFkrynZ176C75K12VYGVHFVBqgBrua/f+BqC3MgwQ2Lg4eyT4uc6/LNyQPkFk8d1YQL2VYbpLZX6/3TBebBI/whWcyyQrUSRXFqQVkI7/+AfHYsVfG5vINLNFuaUN8JOrEqvwyMGv+eWtdZn00diUxhw5a8v/1lr5gkDeYBCf3YQvqbOb8TVeiZKU2GaD0D2zi/pep7tUpjY2QU3TD34BNPPtjvjLw4tpNLs6a1hywsqsYrJlTZrC1VsZhtsNukvl6Ed0mR6NeJ4XOwDPrVc9fzg+bnOk2cqLP+r/4HiP11sZ9norwx7+XR075HhefivbeWhX9KF0cOvVpvNtfITJam0FaY+CvPij3PJu1cUhv3cxjAfnNn4X/QVkEUjTKvHaIpIaMnCfCijDdYmJLtrv/wva+lH9WsKDNEOsZSTuRD/EQ6ThP4h22pnamh8iAAAAAElFTkSuQmCC",6,12,12);
global.spr_hurtb = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAYAAABZY7uwAAACdUlEQVRYhe2YsYsTQRTGf7NaxOasVK45kIhR0Jxw18ghiEREmOXAzvYkJ1wTC1sLi/wB1won/gMq3i5YnIqlFtqk0ByxsgqklmvOZ5HbyW6ym9m9bLIB74MhM7Oz37x88968mVUiwgmS4RRtwLwjjUByVOL6J4ZSSpRSI1xxfUXwn7Y8l4R6Up9KM6kZrJTUGhVTDz/TvjvSJyIz5y88xD5stwGoNSqmhKF9F+27hfGrmE16Ete2rnB41cLGlu5eBuBgbz/SBvC11zcshQflzZ+3QGARKez2EDXUBl97VpHy5o8LsUxxHoOxAouICtw+i/EQv29Mmz9OoDyyRyLH8ApnhU2kvPkL26SHV9fXntkLhtvh/lnz29L8VPHuyibrP18EsQ/A319+/2FnE4BTl/oZxtde5mwW5j/sDImQkr8wDwqyCUA4UThlbX6dsjZG1xqVES9Iy3/Y8XDKmsXmtcg8Tt218sd5kGKKqV5EVBDj93hq3Uh97UXStS2L5c1fmAftNDd4eH6Ng739QVgBP76+ot3rRcZB9owU5g9wc3mJdq834H98y8ofdw6CGRwWd5obrNx+AMD1C8nTtbqKG2v9UEtzDsqbvzAP2n722tRbXUW9usVu76Ip9eoWra7i2+c3QPZMlhd/rAcppZBsH4qyXiIBpOqcNX2rpQXcT+9N27tzH4CXf34f55KaG39SiEH2MMt80w7+wGppgS9XV0bGLC4tc+bR99ShNQ3+wgU6t/4EgI9vn48df1yBJuYXkXElDOLEtLw/tgCifVf6NPPJP86DYOBFEXWPYtxMcFwE55Xh1ZsnfptA/z0K/6I47zgRyIJ/XM8yDC6e9DAAAAAASUVORK5CYII=",3,12,12); // Hurt Sprite Must Always Be At Least 3+ Frames
global.spr_deadb = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAYAAAAVpXQNAAADv0lEQVRoge2bsUsbURzHPykFV5cO7R+gCBUMEhREMQ66SCBOnRR1KHQoOEXqIA7WOAndo23/AENLOqRDIpYU0yJaHELaxaHQzWYSOr0OyXt9l9wld7m7JDb3hSOXe5fv7977/e77fu93FwgQwAVCTk4WQgj1w1DI0W/tmtD27yJ/3+GenZNEDfXHPLwOAYjiUYJKKUellJPH7gp/36JlAHkcKKYmpFPT+Yu7yN/XuN/tC6hHci95p/n7DU0DqJX6yHYX+ZDiT+4liUfDDE8uABCPhplY3Zftvcrf97AcOKdTVxtBJFK7a+rL40cPlHMlymdZACZW98G5k/3mD4BFDtSJvEd3rg7pVKDB4T3EH6CGruZAp8UrXr/7AsDhy3U4y3rqVL/5A9hcxvsF6VyAtRcptS9VQleLXuQP0OUAqsfA0DSAWm57vez2m/8/gtC2pjANIJ+qzAYT61uH1Wmlhm+fPwBwfXNLPBp2u9z2m98WhAa/TGDT0U74PCu4Cgdwc8GAuCxkRGp3TX1SLQC6HSC/+TsxRqb9oepoUSnl9H644pRcm8vztnktk2gnHW5TsURqd43x2SXGphY5PznmtHgFwPrWIQCDI3PKRK/w67Uvn5RFr0018NdUgcGROdL5CzZdrFQBLgsZAMamFg2NrhW6A3eUAMRKLCIuCxnDJhWiF/mdKE6bY6XufKmYK7GIWIlFlEpsLs8r9SkeJZz2RfHo/GbcdfymNkzvvHaCw6EKCQCpEAf7O4bGN++/mproNr8XitNinARUVeb65lap5szEqOEks6KoTTUVxaMEUK2BXd/ccrC/Y+B3WnDtWh1ISnH5LMtGYtvQ9nDwleGxgzY4XeP3aroSQgiLIFLOTe4lefL0uWnw1KNcq21VSjnKZ1n5eKYpv7Txq/K7Kb/kHp5csCx5ePIoo90cSHaoFtkKekddPGbwjN/rXMdkvAzOleUGXR1k/ibxLF4NegslMg0g/ctlIaP43XDbViC9014NaDp/QTwaVibkjvaQs6f5vYQxyKv7K7EIAOOzSyrxh3+J75/vn9Sxcusqu8HxY1OLAmBmYpSNxLZKop1yWxYSm6lKqA7NrroJQsm3Hy3b6rau8tf312W/7VxPCAhZ5GoKA0PTampJ5y+cVtZD1OpldrnN6kK2pNvHwqLfr1P4/rpGu2rsYEwNy22J85NjxmeXOD855kf5J4DK65pMY7ZsWHEDDfzBKwweoVMrVyvIJBoanezWhpag64eDAOoUrILLQ2W3Ci4v+IM/IgTwD38Bkjx8L4Um48AAAAAASUVORK5CYII=",6,12,12);
global.spr_portb = sprite_add_base64("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",1,40,243);
global.spr_iconb = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAABXElEQVQ4jc2UMUvDQBTH/xU/gIuLOGSRIDgoDg24qIMZ4qKTk9AIFTK4VuqcIat0jf0G6eKS5ZrFkA6hbiV09QPkG8QhuTN3uTuoi/7huDyS97v/e+8I8MeqmqXU1iawckWwmI4o+FdA6qhqQDAtWwvVAatyRVCuCJ7vr7gXpmUrk7QOiywGANxcnGA2X7KY7jKXPZW70HdZcLS323FWZDFMy8bO4SXHkTnkYAAwmy87H6nKFoGV5xjIU4LT81u2Dsx9DlpkMStbHNC27JTheILjs2sWf368Y128tnvHHNZ7oHTYgXmO0SnVtGwOriuZk+cYGI4nAIC7xydpL0WJU66AusS2qOPQd7EuvgDUV4k67Q8CxpICZVAAyJMIDy9vWExHrIfNtWEssWR2AHWVJ9EPMCUIfRf9QaDsoWzKPeo0TyLkKZEm1mUG7Rz+QZD2FyUxIA82hOpy/7G+AQ3cgoXr4jLdAAAAAElFTkSuQmCC",1,10,10);
global.spr_slct = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuM4zml1AAAAGjSURBVDhPtZSxSgNBEIbnzipNUGJlgooKip0E0UqwsRAx+gIWom/gq4iNWOQFVAxCDmyFFFEsBRMUoqQwGtKkyzr/3O5l75KLJOIHy8xNdmZn/8ydM5lKK7JIXqxo73equQI5bBUX8SOaYYoEHQyTZCMdzF3v+E8j4P4lGbjajszAAuXskaxBxBaIJsYVcliD0Bxg40RmT/zv2pVYYMey5XPxQaiD4JR8nZQK1e0fY/5XRDCezsmysfUIaRAVqvGa155PavZAexToIKOMMW4dPtJn412Ctnj96Kyf0OrpkvhSwCSal8o8NzILYqMsttvBu+NiszkxWiiO50RCOgaiwUOnQG+3RDPbLNq+xEm1iL6Wux2kai9i7a7QCT0dkzqbJgXbvCQIqjhZFdlXpaTiBD+mgW8Wru/eF9llcDq6AN4d0dZUUnyc7Od1wRXNNUN/Y2WzQDS2Rp5XkgLNdL5nBhzHCWkkHxSIiFnnliU4X98QCyq7N9rziRZw8WCSvQ9WziKa3BcuIIJANFjuRmwc+A05ZgUfVcwA+8Es+Ht7CV+B6AfEvNmUNOCJFwAAAABJRU5ErkJggg==",1,0,0);
global.spr_mapA = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABsAAAAZCAYAAADAHFVeAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH4QQZAx0K1KLnCQAAAbdJREFUSMe1VkFKw0AUfROyKIKIKIggKFm00E3u0E2xBOMVXHoCd1nkEq56BwtDxSMU3KRLC6PFirqxdiPuxkU638lk2jRt81aZyc9/b/78mRcmpcSmYIzlkkgpmTnnYluItefIHuKWVWyqZ4xJrxdk5gV4OTIiiovFiDBNrpMyxqRZSmbbM53I84PSFRUJp1LqhDmyTYlspIrQqYrIBqdKIs8PgPg/t4OKoRM65lnZ1qpEwu2tX3SeKEHIc8L0Oa83H8fAy/k1zu5vM+KdVVYlEg4RcvRHEv1Rquv14obUq3kRctRPfQDA3nF7cYMsQ73rY/LxBQDodGcYJIIIB4lApzsDAIop7MZleBonRKRQ222gttugsXqnYmfvD1j7In77/AaaOzQ+9K7SEg+fgebvPOaHOtDcr1Jk9YMhpi2Q6vFj+nwEYNpq21u+7MpUt+2fXGI6uVu4+SpGfWM6QYbMpkS1sbpUVbJ170eXMSZtNkK24QcQ4ORdRclVHB1qzUhdStKzEBmlsFn9QkT575yVb4wS0EXl/CznyhFyZSu1qmWHmhJF1TpAxqltK7H9S2yFbNvJTfwBnXjrTQh7TuEAAAAASUVORK5CYII=",1,10,10)
global.spr_ult[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAAXCAIAAACAiijJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEKSURBVDhPnZJNCsIwFISLuPAE3kZwoeAd3LjzGq5ceiGhCIKXEAQPInHsvE5e0/THDrN4SfN9xNoidGfzWKq2lUunAljhYru55J+JX623+8MRg66j2tGsAo8Ji89GllSR8CjndmVpKMhTQb5dr0B+iNFVdIUES+otecXpfGETUu1UYEEFM8aCY1EhuPwsWMw9llRBXvD8Nhu0NBSeB4zuagv2r+Udy+frTRJzp4KkryyYIWI55xUiVSkA4BYsRbrIgII8ol+BTlf4chPJvAv+u21FEpxnOQMxBXmGCn/a1w5VnwKH+F1wzUhh695ERRGq1hnJI1GB10GS5eMxsfvT8hepxFcwjQ8hfAHTwkVd6Tb9NAAAAABJRU5ErkJggg==",1,22,23);
global.spr_ult[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAADjElEQVRIiYWWTWgbRxTHfxaCWAk1xRBoCTIKNCDlJLQ+dVMoNYEIfEkv9TY3BXxKbiZQ5VaqNBgfCrVLMSiUglmnB7cHl4WGCF/Wp6yqQxIJdOjipfRQEMUQ1FAc92DeaGY/lAeC3Z03/483M08zcxRunAJE/QC77tJuNbA+/pRpMX9pwOjPMgDbD+4AYH34CbfvP2Lx8pyRm5eHYsXC9+DC3HTwtFhtbgLQbpEgmREHEqLsbQ6ycoODPYMklzZZACReHe8Y36J+kEku5S3On5sQRP2AJzsvifpB6uRixTLeB92CoTg42DPG260GPwd/nxFE/YBixeL6rasMugUG3YJB8up4J1Vl1A8STtNcKAc6qK5Q1MedzZzmFFjarhMXag0G3QLXb11NVZQW/d/PZY7pJTMWWVSKIr08uivJ0V3F1wGg5+9PCMq1sQHyItxKLG4cRM/Xy6SXTRHIQgvQR/ZSwlk83nbiAfLFimUAlGvjhPJpgLqr4LCjTrUiEPW6Ez2mHargYC9Rmu0Hd1htbirixCLHAbPcCGDVXqZqLyvA1eamaoAJAr83zAQs18aJRa7ay+r59v1Himi1uUlw2JkQ7Lq7mSqljRcrliJJaw86kR75XXcXu3rFABQ39754ZiQXKxbFylnOoFug3Wqw1fmB7tM3mWS5FWfF+Oj3hth1l8V7z+mczHLjZDYxUco4W/qL77/5knarkcj57teQm9ZFcxetOCtE/YDOyXPWgX/c8/x0rQnhZKI0x3JtTDiC996Z5b/amJ6/DyS7a14vixB9EH3FNsA1ExTArrschdbZu7bjXoRb/Bu+T3DYUeohZZumnQO77gKwUFpT3wDubjxWc0rz7ybAFYFdd9VPAATMrrv4nqMm1JYmmrpP32DX3Unu55X4Ukwc6Kw6ke85ypXvOfzSXld5vufgew61pZxykUmgh+85HIUbwPSTLEK+XfssM9cguGldZKG0piaKfSmB3xumkgjwQmnNqESqg3jC+teLCdA4kYiIzwXIxQfkNiDgdvUKvucoFwCj/rwaFwFp4AD5rIF4V/U9x1CuyuY5gNlSFMboNblo9NpQL1vS7w2NHqXHwx9/o+fv0241uLvxGN9zDOeGA2GSm1hcrbEzekPVefVWzaR6hnqAmcXLc6cAz/44VltTTq+86/Fk56X6F5N7qOTJeupVST0H0/Z+uTZW99e0e5QODvA//87SsmhFdnIAAAAASUVORK5CYII=",1,12,16);

 // Set Ultra Variables:
global.ultra[1] = 1;
global.ultra[2] = 1;



 // When Player is First Created:
#define create
 // Passive : More Max HP:
maxhealth = 10 + (skill_get(1) * 4);
maxspeed = 4.1




 // Set Player Sprites
 // 1st = A-Skin 
 // 2nd = B-Skin
 // 3rd = Winter Hat In Frozen City
if bskin = 0{ // A-Skin:
	spr_idle = global.spr_idle; // Idle
	spr_walk = global.spr_walk; // Walk
	spr_hurt = global.spr_hurt; // Hurt
	spr_dead = sprBanditDead; // Dead
	spr_sit1 = global.spr_sit; // Sit A
	spr_sit2 = global.spr_sit // Go Sit A
}
if bskin = 1{ // B-Skin:
	spr_idle = global.spr_idleb; // Idle
	spr_walk = global.spr_walkb; // Walk
	spr_hurt = global.spr_hurtb; // Hurt
	spr_dead = sprScorpionDead; // Dead
	spr_sit = sprMutant1Sit; // Sit
}




	// You Can Do Something Like This Instead If You Aren't Using Custom Sprites:
//spr_idle = sprScorpionIdle;
//spr_walk = sprScorpionWalk;
//spr_hurt = sprScorpionHurt;
//spr_dead = sprScorpionDead;

	

#define race_soundbank
return 16;

#define step 
 // Active : I N F I N I T E  G R E N A D E S
if button_pressed(index,"spec") {
    {
        {
            with instance_create(x,y,PopoNade){
                		team = other.team

			
				creator = other.id;
                    motion_add(point_direction(x,y,mouse_x[other.index],mouse_y [other.index]),12)
                    image_angle = direction
                        z = -1;
						zspeed = 1;
                    team = other.team
			
			
			with instance_create(1, 1,Breath ){

			
			
            }
        }
    }
}
}

 

 // Yes, stare at my amazing face
#define race_mapicon
return global.spr_mapA;


 // Set Character Selection Icon:
#define race_menu_button
sprite_index = global.spr_slct;

 // You really should already know my name ;]
#define race_name
return "COSMI";

 // Selection Description:
#define race_text
return "FAST, EXTRA @rHEALTH#@wHIGHER FIRE RATE";





 // Character Has 3 Skins:
#define race_skins
return 3;

 // THRONEBUTT DOES NOTHING YET, STOP ASKING
#define race_tb_text
return "LESS COST ON THROWING GRENADES";

 // Ultra Portraits
#define race_ultra_button
sprite_index = global.spr_ult[argument0];
// Add More Ultra Icon "global.spr_ult[#]" Sprites For More Ultras

 // Ultra Names:
#define race_ultra_name
switch(argument0){ //ultra names
	case 1: return "Sonic Speed";
	case 2: return "Car Mechanic";
}

#define race_ultra_text 
switch (argument0){ //ultra words
case 1: return "CHARGE STOPS WHEN NOT RIGHT-CLICKING#CHARGE SHOOTS BULLETS"; 
case 2: return "AUTO-PICKUP CARS WHILE CHARGING#CHARGE AGAIN TO THROW THEM#KILLS SPAWN CARS"; 

}


 // When Player Takes An Ultra:
#define race_ultra_take
global.ultra[argument0] = 1; // Confirm Which Ultra Was Taken
if(global.ultra[1] = 1) sound_play(sndMeltingUltraA);
 // Ultra B : Half Health, 3 Mutations
if global.ultra[2] = 1{
	sound_play(sndMeltingUltraB);
	with(Player){


	}
	GameCont.skillpoints += 0;
}
sound_play(sndBasicUltra);


 // Loading Screen Tips:
#define race_ttip
return["A N I M E H A I R", "WHAT EVEN IS A HAIRCUT?", "FISHCAROLL = SOME FOOD I ATE", "OI", "RIVETING!1!11111", "JAWNSON = FATHERLY FIGURE"];