
//{{BLOCK(grassyBG)

//======================================================================
//
//	grassyBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 170 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 5440 + 4096 = 10048
//
//	Time-stamp: 2017-11-21, 19:57:09
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GRASSYBG_H
#define GRIT_GRASSYBG_H

#define grassyBGTilesLen 5440
extern const unsigned short grassyBGTiles[2720];

#define grassyBGMapLen 4096
extern const unsigned short grassyBGMap[2048];

#define grassyBGPalLen 512
extern const unsigned short grassyBGPal[256];

#endif // GRIT_GRASSYBG_H

//}}BLOCK(grassyBG)
