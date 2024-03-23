ENTRY(main)

SECTIONS
{
	. = 0x0;
	.rom.text :
	{
		jump.o
		_lyj_text_end = ABSOLUTE(.);
	}
	. = 0xffffff0;
	.rom1.text :
	{
		main.o
	}
}
