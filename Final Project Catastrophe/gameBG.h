
//{{BLOCK(gameBG)

//======================================================================
//
//	gameBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 49 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 1568 + 4096 = 6176
//
//	Time-stamp: 2017-11-28, 19:48:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBGTilesLen 1568
extern const unsigned short gameBGTiles[784];

#define gameBGMapLen 4096
extern const unsigned short gameBGMap[2048];

#define gameBGPalLen 512
extern const unsigned short gameBGPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBG)
