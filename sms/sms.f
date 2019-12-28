\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\                        Super Magic Square Сomplexity O(N)                       \\
\\                         Copyright (c) 2019, hammerlok                           \\
\\                            mr.grimmaxel@gmail.com                               \\
\\                                    *****                                        \\
\\ This software is provided 'as-is', without any express or implied warranty.     \\
\\ In no event will the authors be held liable for any damages arising from the    \\
\\ use of this software.                                                           \\
\\ Permission is granted to anyone to use this software for any purpose,           \\
\\ including commercial applications, and to alter it and redistribute it          \\
\\ freely, subject to the following restrictions :                                 \\
\\                                                                                 \\
\\ 1. The origin of this software must not be misrepresented; you must not claim   \\
\\    that you wrote the original software. If you use this software in a product, \\
\\    an acknowledgment in the product documentation is required.                  \\
\\                                                                                 \\
\\ 2. Altered source versions must be plainly marked as such, and must not be      \\
\\    misrepresented as being the original software.                               \\
\\                                                                                 \\
\\ 3. This notice may not be removed or altered from any source distribution.      \\
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ SYSTEM:   WinForth, version 1.0                                                 \\
\\ FILE:     sms.f                                                                 \\
\\ AUTHOR:   hammerlok                                                             \\
\\ CREATED:  28-Dec-2019                                                           \\
\\ VERSIONS: 1.0 Released 28-Dec-2019                                              \\
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

" winforthex.f" INCLUDE-FILE

: SuperMagicSquare {: | size k ps m arr d mij i :}  \ ( size -> .. )
    DUP 2 MOD IF 
        EXPAND TO size 
        2/ TO m 
        1 TO k 
        DUP * DUP 
        1+ TO ps 
        CELLS ALLOCATE TO arr
 
        0 TO d 
        BEGIN d m < IF 
            size d - 1- TO mij 

            d 1+ TO i
            BEGIN i m <= IF
                k EXPAND
                d size * i + CELLS arr + !
                ps - NEGATE
                mij size * i + CELLS arr + !
                i 1+ TO i
                1+ TO k
            0 ELSE 1 THEN UNTIL

            d 1+ TO i
            BEGIN i m < IF
                k EXPAND
                i size * mij + CELLS arr + !
                ps - NEGATE
                i size * d + CELLS arr + !
                i 1+ TO i
                1+ TO k
            0 ELSE 1 THEN UNTIL

            m 1+ TO i
            BEGIN i mij < IF
                k EXPAND
                mij size * i + CELLS arr + !
                ps - NEGATE
                d size * i + CELLS arr + !
                i 1+ TO i
                1+ TO k
            0 ELSE 1 THEN UNTIL

            k EXPAND
            mij size * mij + CELLS arr + !
            ps - NEGATE
            d size * d + CELLS arr + !
            1+

            EXPAND
            m size * d + CELLS arr + !
            ps - NEGATE
            m size * mij + CELLS arr + !
            1+ 

            EXPAND
            mij size * d + CELLS arr + !
            ps - NEGATE
            d size * mij + CELLS arr + !
            1+ TO k

            m 1+ TO i
            BEGIN i mij < IF
                k EXPAND
                i size * d + CELLS arr + !
                ps - NEGATE
                i size * mij + CELLS arr + !
                i 1+ TO i
                1+ TO k
            0 ELSE 1 THEN UNTIL
        d 1+ TO d
        0 ELSE 1 THEN UNTIL
        k m size * m + CELLS arr + !

        arr
        size 0 DO 
            size 0 DO
                DUP @ . SPACE
                CELL+
            LOOP
            CR
        LOOP
        DROP 

        arr FREE
    ELSE
        DROP ." Incorrect size! Should be odd"
    THEN    
;