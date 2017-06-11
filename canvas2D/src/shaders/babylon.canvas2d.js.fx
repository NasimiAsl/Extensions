BABYLON.Effect.ShadersStore['ellipse2dPixelShader'] = "varying vec4 vColor;\nvoid main(void) {\ngl_FragColor=vColor;\n}";
BABYLON.Effect.ShadersStore['ellipse2dVertexShader'] = "\n#ifdef Instanced\n#define att attribute\n#else\n#define att uniform\n#endif\nattribute float index;\natt vec2 zBias;\natt vec4 transformX;\natt vec4 transformY;\natt vec3 renderingInfo;\natt float opacity;\n#ifdef Border\natt float borderThickness;\n#endif\n#ifdef FillSolid\natt vec4 fillSolidColor;\n#endif\n#ifdef BorderSolid\natt vec4 borderSolidColor;\n#endif\n#ifdef FillGradient\natt vec4 fillGradientColor1;\natt vec4 fillGradientColor2;\natt vec4 fillGradientTY;\n#endif\n#ifdef BorderGradient\natt vec4 borderGradientColor1;\natt vec4 borderGradientColor2;\natt vec4 borderGradientTY;\n#endif\n\natt vec3 properties;\n#define TWOPI 6.28318530\n\nvarying vec2 vUV;\nvarying vec4 vColor;\nvoid main(void) {\nvec2 pos2;\n#ifdef Border\nfloat w=properties.x;\nfloat h=properties.y;\nfloat ms=properties.z;\nvec2 borderOffset=vec2(1.0,1.0);\nfloat segi=index;\nif (index<ms) {\nborderOffset=vec2(1.0-(borderThickness*2.0/w),1.0-(borderThickness*2.0/h));\n}\nelse {\nsegi-=ms;\n}\nfloat angle=TWOPI*segi/ms;\npos2.x=(cos(angle)/2.0)+0.5;\npos2.y=(sin(angle)/2.0)+0.5;\npos2.x=((pos2.x-0.5)*borderOffset.x)+0.5;\npos2.y=((pos2.y-0.5)*borderOffset.y)+0.5;\n#else\nif (index == 0.0) {\npos2=vec2(0.5,0.5);\n}\nelse {\nfloat ms=properties.z;\nfloat angle=TWOPI*(index-1.0)/ms;\npos2.x=(cos(angle)/2.0)+0.5;\npos2.y=(sin(angle)/2.0)+0.5;\n}\n#endif\n#ifdef FillSolid\nvColor=fillSolidColor;\n#endif\n#ifdef BorderSolid\nvColor=borderSolidColor;\n#endif\n#ifdef FillGradient\nfloat v=dot(vec4(pos2.xy,1,1),fillGradientTY);\nvColor=mix(fillGradientColor2,fillGradientColor1,v); \n#endif\n#ifdef BorderGradient\nfloat v=dot(vec4(pos2.xy,1,1),borderGradientTY);\nvColor=mix(borderGradientColor2,borderGradientColor1,v); \n#endif\nvColor.a*=opacity;\nvec4 pos;\npos.xy=pos2.xy*properties.xy;\npos.z=1.0;\npos.w=1.0;\nfloat x=dot(pos,transformX);\nfloat y=dot(pos,transformY);\nif (renderingInfo.z == 1.0) {\nfloat rw=renderingInfo.x;\nfloat rh=renderingInfo.y;\nfloat irw=2.0/rw;\nfloat irh=2.0/rh;\nx=(floor((x/irw)+0.5)*irw)+irw/2.0;\ny=(floor((y/irh)+0.5)*irh)+irh/2.0;\n}\ngl_Position=vec4(x,y,zBias.x,1);\n}";
BABYLON.Effect.ShadersStore['lines2dPixelShader'] = "varying vec4 vColor;\nvoid main(void) {\ngl_FragColor=vColor;\n}";
BABYLON.Effect.ShadersStore['lines2dVertexShader'] = "\n#ifdef Instanced\n#define att attribute\n#else\n#define att uniform\n#endif\nattribute vec2 position;\natt vec2 zBias;\natt vec4 transformX;\natt vec4 transformY;\natt vec3 renderingInfo;\natt float opacity;\n#ifdef FillSolid\natt vec4 fillSolidColor;\n#endif\n#ifdef BorderSolid\natt vec4 borderSolidColor;\n#endif\n#ifdef FillGradient\natt vec2 boundingMin;\natt vec2 boundingMax;\natt vec4 fillGradientColor1;\natt vec4 fillGradientColor2;\natt vec4 fillGradientTY;\n#endif\n#ifdef BorderGradient\natt vec4 borderGradientColor1;\natt vec4 borderGradientColor2;\natt vec4 borderGradientTY;\n#endif\n#define TWOPI 6.28318530\n\nvarying vec2 vUV;\nvarying vec4 vColor;\nvoid main(void) {\n#ifdef FillSolid\nvColor=fillSolidColor;\n#endif\n#ifdef BorderSolid\nvColor=borderSolidColor;\n#endif\n#ifdef FillGradient\nfloat v=dot(vec4((position.xy-boundingMin)/(boundingMax-boundingMin),1,1),fillGradientTY);\nvColor=mix(fillGradientColor2,fillGradientColor1,v); \n#endif\n#ifdef BorderGradient\nfloat v=dot(vec4((position.xy-boundingMin)/(boundingMax-boundingMin),1,1),borderGradientTY);\nvColor=mix(borderGradientColor2,borderGradientColor1,v); \n#endif\nvColor.a*=opacity;\nvec4 pos;\npos.xy=position.xy;\npos.z=1.0;\npos.w=1.0;\nfloat x=dot(pos,transformX);\nfloat y=dot(pos,transformY);\nif (renderingInfo.z == 1.0) {\nfloat rw=renderingInfo.x;\nfloat rh=renderingInfo.y;\nfloat irw=2.0/rw;\nfloat irh=2.0/rh;\nx=(floor((x/irw)+0.5)*irw)+irw/2.0;\ny=(floor((y/irh)+0.5)*irh)+irh/2.0;\n}\ngl_Position=vec4(x,y,zBias.x,1);\n}";
BABYLON.Effect.ShadersStore['rect2dPixelShader'] = "varying vec4 vColor;\nvoid main(void) {\ngl_FragColor=vColor;\n}";
BABYLON.Effect.ShadersStore['rect2dVertexShader'] = "\n#ifdef Instanced\n#define att attribute\n#else\n#define att uniform\n#endif\nattribute float index;\natt vec2 zBias;\natt vec4 transformX;\natt vec4 transformY;\natt vec3 renderingInfo;\natt float opacity;\n#ifdef Border\natt float borderThickness;\n#endif\n#ifdef FillSolid\natt vec4 fillSolidColor;\n#endif\n#ifdef BorderSolid\natt vec4 borderSolidColor;\n#endif\n#ifdef FillGradient\natt vec4 fillGradientColor1;\natt vec4 fillGradientColor2;\natt vec4 fillGradientTY;\n#endif\n#ifdef BorderGradient\natt vec4 borderGradientColor1;\natt vec4 borderGradientColor2;\natt vec4 borderGradientTY;\n#endif\n\natt vec3 properties;\n\n#define rsub0 17.0\n#define rsub1 33.0\n#define rsub2 49.0\n#define rsub3 65.0\n#define rsub 64.0\n#define TWOPI 6.28318530\n\nvarying vec2 vUV;\nvarying vec4 vColor;\nvoid main(void) {\nvec2 pos2;\n\nif (properties.z == 0.0) {\n#ifdef Border\nfloat w=properties.x;\nfloat h=properties.y;\nvec2 borderOffset=vec2(1.0,1.0);\nfloat segi=index;\nif (index<4.0) {\nborderOffset=vec2(1.0-(borderThickness*2.0/w),1.0-(borderThickness*2.0/h));\n}\nelse {\nsegi-=4.0;\n}\nif (segi == 0.0) {\npos2=vec2(1.0,1.0);\n} \nelse if (segi == 1.0) {\npos2=vec2(1.0,0.0);\n}\nelse if (segi == 2.0) {\npos2=vec2(0.0,0.0);\n} \nelse {\npos2=vec2(0.0,1.0);\n}\npos2.x=((pos2.x-0.5)*borderOffset.x)+0.5;\npos2.y=((pos2.y-0.5)*borderOffset.y)+0.5;\n#else\nif (index == 0.0) {\npos2=vec2(0.5,0.5);\n}\nelse if (index == 1.0) {\npos2=vec2(1.0,1.0);\n}\nelse if (index == 2.0) {\npos2=vec2(1.0,0.0);\n}\nelse if (index == 3.0) {\npos2=vec2(0.0,0.0);\n}\nelse {\npos2=vec2(0.0,1.0);\n}\n#endif\n}\nelse\n{\n#ifdef Border\nfloat w=properties.x;\nfloat h=properties.y;\nfloat r=properties.z;\nfloat nru=r/w;\nfloat nrv=r/h;\nvec2 borderOffset=vec2(1.0,1.0);\nfloat segi=index;\nif (index<rsub) {\nborderOffset=vec2(1.0-(borderThickness*2.0/w),1.0-(borderThickness*2.0/h));\n}\nelse {\nsegi-=rsub;\n}\n\nif (segi<rsub0) {\npos2=vec2(1.0-nru,nrv);\n}\n\nelse if (segi<rsub1) {\npos2=vec2(nru,nrv);\n}\n\nelse if (segi<rsub2) {\npos2=vec2(nru,1.0-nrv);\n}\n\nelse {\npos2=vec2(1.0-nru,1.0-nrv);\n}\nfloat angle=TWOPI-((index-1.0)*TWOPI/(rsub-0.5));\npos2.x+=cos(angle)*nru;\npos2.y+=sin(angle)*nrv;\npos2.x=((pos2.x-0.5)*borderOffset.x)+0.5;\npos2.y=((pos2.y-0.5)*borderOffset.y)+0.5;\n#else\nif (index == 0.0) {\npos2=vec2(0.5,0.5);\n}\nelse {\nfloat w=properties.x;\nfloat h=properties.y;\nfloat r=properties.z;\nfloat nru=r/w;\nfloat nrv=r/h;\n\nif (index<rsub0) {\npos2=vec2(1.0-nru,nrv);\n}\n\nelse if (index<rsub1) {\npos2=vec2(nru,nrv);\n}\n\nelse if (index<rsub2) {\npos2=vec2(nru,1.0-nrv);\n}\n\nelse {\npos2=vec2(1.0-nru,1.0-nrv);\n}\nfloat angle=TWOPI-((index-1.0)*TWOPI/(rsub-0.5));\npos2.x+=cos(angle)*nru;\npos2.y+=sin(angle)*nrv;\n}\n#endif\n}\n#ifdef FillSolid\nvColor=fillSolidColor;\n#endif\n#ifdef BorderSolid\nvColor=borderSolidColor;\n#endif\n#ifdef FillGradient\nfloat v=dot(vec4(pos2.xy,1,1),fillGradientTY);\nvColor=mix(fillGradientColor2,fillGradientColor1,v); \n#endif\n#ifdef BorderGradient\nfloat v=dot(vec4(pos2.xy,1,1),borderGradientTY);\nvColor=mix(borderGradientColor2,borderGradientColor1,v); \n#endif\nvColor.a*=opacity;\nvec4 pos;\npos.xy=pos2.xy*properties.xy;\npos.z=1.0;\npos.w=1.0;\nfloat x=dot(pos,transformX);\nfloat y=dot(pos,transformY);\nif (renderingInfo.z == 1.0) {\nfloat rw=renderingInfo.x;\nfloat rh=renderingInfo.y;\nfloat irw=2.0/rw;\nfloat irh=2.0/rh;\nx=(floor((x/irw)+0.5)*irw)+irw/2.0;\ny=(floor((y/irh)+0.5)*irh)+irh/2.0;\n}\ngl_Position=vec4(x,y,zBias.x,1);\n}";
BABYLON.Effect.ShadersStore['sprite2dPixelShader'] = "varying vec2 vUV;\nvarying float vOpacity;\n#ifdef Scale9\nvarying vec2 vTopLeftUV;\nvarying vec2 vBottomRightUV;\nvarying vec4 vScale9;\nvarying vec2 vScaleFactor;\n#endif\nuniform bool alphaTest;\nuniform sampler2D diffuseSampler;\nvoid main(void) {\nvec2 uv=vUV;\n#ifdef Scale9\nvec2 sizeUV=vBottomRightUV-vTopLeftUV;\n\nfloat leftPartUV=vTopLeftUV.x+(vScale9.x/vScaleFactor.x);\nfloat rightPartUV=vTopLeftUV.x+sizeUV.x-((sizeUV.x-vScale9.z)/vScaleFactor.x);\nif (vUV.x<leftPartUV) {\nuv.x=vTopLeftUV.x+((vUV.x- vTopLeftUV.x)*vScaleFactor.x);\n}\nelse if (vUV.x>rightPartUV) {\nuv.x=vTopLeftUV.x+vScale9.z+((vUV.x-rightPartUV)*vScaleFactor.x);\n}\nelse {\nfloat r=(vUV.x-leftPartUV)/(rightPartUV-leftPartUV);\nuv.x=vTopLeftUV.x+vScale9.x+((vScale9.z-vScale9.x)*r);\n}\n\nfloat topPartUV=(vTopLeftUV.y+(vScale9.y/vScaleFactor.y));\nfloat bottomPartUV=(vTopLeftUV.y+sizeUV.y-((sizeUV.y-vScale9.w)/vScaleFactor.y));\nif (vUV.y<topPartUV) {\nuv.y=vTopLeftUV.y+((vUV.y-vTopLeftUV.y)*vScaleFactor.y);\n}\nelse if (vUV.y>bottomPartUV) {\nuv.y=vTopLeftUV.y+vScale9.w+((vUV.y-bottomPartUV)*vScaleFactor.y);\n}\nelse {\nfloat r=(vUV.y-topPartUV)/(bottomPartUV-topPartUV);\nuv.y=vTopLeftUV.y+vScale9.y+((vScale9.w-vScale9.y)*r);\n}\n#endif\nvec4 color=texture2D(diffuseSampler,uv);\nif (alphaTest)\n{\nif (color.a<0.95) {\ndiscard;\n}\n}\ncolor.a*=vOpacity;\ngl_FragColor=color;\n}";
BABYLON.Effect.ShadersStore['sprite2dVertexShader'] = "\n#ifdef Instanced\n#define att attribute\n#else\n#define att uniform\n#endif\n\nattribute float index;\natt vec2 topLeftUV;\natt vec2 sizeUV;\n#ifdef Scale9\natt vec2 scaleFactor;\n#endif\natt vec2 textureSize;\n\natt vec3 properties;\n#ifdef Scale9\natt vec4 scale9;\n#endif\natt vec2 zBias;\natt vec4 transformX;\natt vec4 transformY;\natt vec3 renderingInfo;\natt float opacity;\n\n\nvarying vec2 vUV;\nvarying float vOpacity;\n#ifdef Scale9\nvarying vec2 vTopLeftUV;\nvarying vec2 vBottomRightUV;\nvarying vec4 vScale9;\nvarying vec2 vScaleFactor;\n#endif\nvoid main(void) {\nvec2 pos2;\nfloat frame=properties.x;\nfloat invertY=properties.y;\nfloat alignToPixel=properties.z;\n\nif (index == 0.0) {\npos2=vec2(0.0,0.0);\nvUV=vec2(topLeftUV.x+(frame*sizeUV.x),topLeftUV.y);\n}\n\nelse if (index == 1.0) {\npos2=vec2(0.0,1.0);\nvUV=vec2(topLeftUV.x+(frame*sizeUV.x),(topLeftUV.y+sizeUV.y));\n}\n\nelse if (index == 2.0) {\npos2=vec2( 1.0,1.0);\nvUV=vec2(topLeftUV.x+sizeUV.x+(frame*sizeUV.x),(topLeftUV.y+sizeUV.y));\n}\n\nelse if (index == 3.0) {\npos2=vec2( 1.0,0.0);\nvUV=vec2(topLeftUV.x+sizeUV.x+(frame*sizeUV.x),topLeftUV.y);\n}\nif (invertY == 1.0) {\nvUV.y=1.0-vUV.y;\n}\n\nvec4 pos;\n\n\n\n\npos.xy=pos2.xy*sizeUV*textureSize;\n\n#ifdef Scale9\nif (invertY == 1.0) {\nvTopLeftUV=vec2(topLeftUV.x,1.0-(topLeftUV.y+sizeUV.y));\nvBottomRightUV=vec2(topLeftUV.x+sizeUV.x,1.0-topLeftUV.y);\nvScale9=vec4(scale9.x,sizeUV.y-scale9.w,scale9.z,sizeUV.y-scale9.y);\n}\nelse {\nvTopLeftUV=topLeftUV;\nvBottomRightUV=vec2(topLeftUV.x+sizeUV.x,topLeftUV.y+sizeUV.y);\nvScale9=scale9;\n}\nvScaleFactor=scaleFactor;\n#endif\nvOpacity=opacity;\npos.z=1.0;\npos.w=1.0;\nfloat x=dot(pos,transformX);\nfloat y=dot(pos,transformY);\nif (renderingInfo.z == 1.0) {\nfloat rw=renderingInfo.x;\nfloat rh=renderingInfo.y;\nfloat irw=2.0/rw;\nfloat irh=2.0/rh;\nx=(floor((x/irw))*irw)+irw/2.0;\ny=(floor((y/irh))*irh)+irh/2.0;\n}\ngl_Position=vec4(x,y,zBias.x,1.0);\n} ";
BABYLON.Effect.ShadersStore['text2dPixelShader'] = "\nvarying vec4 vColor;\nvarying vec2 vUV;\n\nuniform sampler2D diffuseSampler;\nvoid main(void) {\n#ifdef SignedDistanceField\nfloat dist=texture2D(diffuseSampler,vUV).r;\nif (dist<0.5) {\ndiscard;\n}\n\n\n\n\n\ngl_FragColor=vec4(vColor.xyz*dist,vColor.a);\n#else\nvec4 color=texture2D(diffuseSampler,vUV);\nif (color.a == 0.0) {\ndiscard;\n}\n#ifdef FontTexture\ngl_FragColor=vec4(color.xxx*vColor.xyz*vColor.a,color.x*vColor.a);\n#else\ngl_FragColor=color*vColor;\n#endif\n#endif\n}";
BABYLON.Effect.ShadersStore['text2dVertexShader'] = "\n#ifdef Instanced\n#define att attribute\n#else\n#define att uniform\n#endif\n\nattribute float index;\natt vec2 zBias;\natt vec4 transformX;\natt vec4 transformY;\natt vec3 renderingInfo;\natt float opacity;\natt vec2 topLeftUV;\natt vec2 sizeUV;\natt vec2 textureSize;\natt vec4 color;\natt float superSampleFactor;\n\nvarying vec2 vUV;\nvarying vec4 vColor;\nvoid main(void) {\nvec2 pos2;\n\nif (index == 0.0) {\npos2=vec2(0.0,0.0);\nvUV=vec2(topLeftUV.x,topLeftUV.y+sizeUV.y);\n}\n\nelse if (index == 1.0) {\npos2=vec2(0.0,1.0);\nvUV=vec2(topLeftUV.x,topLeftUV.y);\n}\n\nelse if (index == 2.0) {\npos2=vec2(1.0,1.0);\nvUV=vec2(topLeftUV.x+sizeUV.x,topLeftUV.y);\n}\n\nelse if (index == 3.0) {\npos2=vec2(1.0,0.0);\nvUV=vec2(topLeftUV.x+sizeUV.x,topLeftUV.y+sizeUV.y);\n}\n\n\n\nvColor=color;\nvColor.a*=opacity;\nvec4 pos;\npos.xy=pos2.xy*superSampleFactor*sizeUV*textureSize;\npos.z=1.0;\npos.w=1.0;\nfloat x=dot(pos,transformX);\nfloat y=dot(pos,transformY);\nif (renderingInfo.z == 1.0) {\nfloat rw=renderingInfo.x;\nfloat rh=renderingInfo.y;\nfloat irw=2.0/rw;\nfloat irh=2.0/rh;\nx=((floor((x/irw)+0.5)*irw)+irw/2.0)+0.5*irw;\ny=((floor((y/irh)+0.5)*irh)+irh/2.0)+0.5*irh;\n}\ngl_Position=vec4(x,y,zBias.x,1.0);\n}";
BABYLON.Effect.ShadersStore['wireframe2dPixelShader'] = "varying vec4 vColor;\nvoid main(void) {\ngl_FragColor=vColor;\n}";
BABYLON.Effect.ShadersStore['wireframe2dVertexShader'] = "\n#ifdef Instanced\n#define att attribute\n#else\n#define att uniform\n#endif\n\nattribute vec2 pos;\nattribute vec4 col;\n\n\n\n\natt vec3 properties;\natt vec2 zBias;\natt vec4 transformX;\natt vec4 transformY;\natt vec3 renderingInfo;\natt float opacity;\n\n\nvarying vec4 vColor;\nvoid main(void) {\nvec4 p=vec4(pos.xy,1.0,1.0);\nvColor=vec4(col.xyz,col.w*opacity);\nfloat x=dot(p,transformX);\nfloat y=dot(p,transformY);\nif (renderingInfo.z == 1.0) {\nfloat rw=renderingInfo.x;\nfloat rh=renderingInfo.y;\nfloat irw=2.0/rw;\nfloat irh=2.0/rh;\nx=(floor((x/irw)+0.5)*irw)+irw/2.0;\ny=(floor((y/irh)+0.5)*irh)+irh/2.0;\n}\ngl_Position=vec4(x,y,zBias.x,1);\n}";
