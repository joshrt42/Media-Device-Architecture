
//{{BLOCK(mountains)

//======================================================================
//
//	mountains, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 193 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 6176 + 4096 = 10784
//
//	Time-stamp: 2017-11-29, 00:23:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MOUNTAINS_H
#define GRIT_MOUNTAINS_H

#define mountainsTilesLen 6176
extern const unsigned short mountainsTiles[3088];

#define mountainsMapLen 4096
extern const unsigned short mountainsMap[2048];

#define mountainsPalLen 512
extern const unsigned short mountainsPal[256];

#endif // GRIT_MOUNTAINS_H

//}}BLOCK(mountains)
