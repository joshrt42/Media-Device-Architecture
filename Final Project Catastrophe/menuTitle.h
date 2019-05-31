
//{{BLOCK(menuTitle)

//======================================================================
//
//	menuTitle, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 175 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 5600 + 4096 = 10208
//
//	Time-stamp: 2017-11-22, 12:09:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MENUTITLE_H
#define GRIT_MENUTITLE_H

#define menuTitleTilesLen 5600
extern const unsigned short menuTitleTiles[2800];

#define menuTitleMapLen 4096
extern const unsigned short menuTitleMap[2048];

#define menuTitlePalLen 512
extern const unsigned short menuTitlePal[256];

#endif // GRIT_MENUTITLE_H

//}}BLOCK(menuTitle)
