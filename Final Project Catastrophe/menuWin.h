
//{{BLOCK(menuWin)

//======================================================================
//
//	menuWin, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 221 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 7072 + 4096 = 11680
//
//	Time-stamp: 2017-11-21, 19:58:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MENUWIN_H
#define GRIT_MENUWIN_H

#define menuWinTilesLen 7072
extern const unsigned short menuWinTiles[3536];

#define menuWinMapLen 4096
extern const unsigned short menuWinMap[2048];

#define menuWinPalLen 512
extern const unsigned short menuWinPal[256];

#endif // GRIT_MENUWIN_H

//}}BLOCK(menuWin)
