
//{{BLOCK(gameBG)

//======================================================================
//
//	gameBG, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 34 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 1088 + 8192 = 9792
//
//	Time-stamp: 2017-11-15, 16:30:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBGTilesLen 1088
extern const unsigned short gameBGTiles[544];

#define gameBGMapLen 8192
extern const unsigned short gameBGMap[4096];

#define gameBGPalLen 512
extern const unsigned short gameBGPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBG)
