extern void jump_long_away(void);
typedef void (*test_call)(void);
void test_jump(void)
{
	jump_long_away();	
    test_call a = 0x1245;
    a();
}
