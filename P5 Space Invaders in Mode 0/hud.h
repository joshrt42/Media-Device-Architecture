
//{{BLOCK(hud)

//======================================================================
//
//	hud, 256x256@4, 
//	+ 17 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 544 + 2048 = 2592
//
//	Time-stamp: 2017-11-15, 16:29:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HUD_H
#define GRIT_HUD_H

#define hudTilesLen 544
extern const unsigned short hudTiles[272];

#define hudMapLen 2048
extern const unsigned short hudMap[1024];

#endif // GRIT_HUD_H

//}}BLOCK(hud)
