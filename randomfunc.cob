       >>SOURCE FORMAT FREE
identification division.
program-id. randomfunc.
environment division.
data division.
working-storage section.
       01  ws-first-time pic 9(1) value 0.
       01  ws-rnd-seed-x pic x(8).
       01  ws-rnd-seed-9 redefines ws-rnd-seed-x pic 9(8).
       01  ws-rnd-dbl comp-2.
linkage section.
       01  ls-min pic x comp-x.
       01  ls-max pic x comp-x.
       01  ls-result pic x comp-x.
procedure division using ls-min, ls-max, ls-result.
startderp.
      if ws-first-time = 0
         move 32768 to ws-rnd-seed-9
         perform until ws-rnd-seed-9 < 32768
            accept ws-rnd-seed-x from time
            move function reverse(ws-rnd-seed-x) to ws-rnd-seed-x
            compute ws-rnd-seed-9 = ws-rnd-seed-9 / 3060
         end-perform
         compute ws-rnd-dbl = function random(ws-rnd-seed-9)
         move 1 to ws-first-time
      end-if.
      perform Derp with test after until ls-result > ls-min.
      exit program.
Derp.
      compute ls-result = (function random() * ls-max) + 1.