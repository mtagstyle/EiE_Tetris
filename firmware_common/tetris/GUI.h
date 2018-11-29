#ifndef GUI_H
#define GUI_H

void GUIPrintTetromino(GameInstance* game);
void GUIPrintGrid(GameInstance* game);
void GUIPrintBlock(uint8_t x, uint8_t y, uint8_t val);
void GUISetPixelValue(uint8_t col, uint8_t row, uint8_t val);
void GUIPrintBorders(void);
void GUIPrintScore(uint16_t lines);

void print_top_half(GameInstance* game);
void print_bottom_half(GameInstance *game);
void print_tetromino_gui(GameInstance* game);

#endif