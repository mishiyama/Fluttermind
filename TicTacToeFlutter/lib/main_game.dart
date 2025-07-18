import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:tic_tac_toe/game_home.dart';

class GameArena extends StatefulWidget {
  const GameArena({super.key});

  @override
  State<GameArena> createState() => _GameArenaState();
}

class _GameArenaState extends State<GameArena> {
  List<String> board = List.filled(9, '');

  static const String playerX = '❌';
  static const String playerO = '🔵';
  String firstTurn() {
    final random = Random();
    return random.nextBool() ? playerX : playerO;
  }

  String switchPlayer(String current) {
    return current == playerX ? playerO : playerX;
  }

  bool winningCondition(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2], // top row
      [3, 4, 5], // middle row
      [6, 7, 8], // bottom row
      [0, 3, 6], // left column
      [1, 4, 7], // middle column
      [2, 5, 8], // right column
      [0, 4, 8], // diagonal
      [2, 4, 6], // diagonal
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }

    return false;
  }

  late String currentplayer;
  @override
  void initState() {
    super.initState();
    currentplayer = firstTurn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current turn:- $currentplayer ',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(16),

              children: List.generate(9, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (board[index] == '') {
                        board[index] = currentplayer;
                      }
                    });
                    if (winningCondition(currentplayer)) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('GAME OVER'),
                          content: Text(
                            '$currentplayer wins',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  board = List.filled(9, '');
                                  currentplayer = firstTurn();
                                });
                              },
                              child: Text('Play Again'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const GameHome(),
                                  ),
                                );
                              },
                              child: Text('Exit'),
                            ),
                          ],
                        ),
                      );
                    } else if (!board.contains('')) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('GAME OVER'),
                          content: Text(
                            'It was a tie',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  board = List.filled(9, '');
                                  currentplayer = firstTurn();
                                });
                              },
                              child: Text('Play Again'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const GameHome(),
                                  ),
                                );
                              },
                              child: Text('Exit'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      currentplayer = switchPlayer(currentplayer);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(
                          255,
                          231,
                          205,
                          205,
                        ), // 👈 visible border color
                        width: 2, // 👈 thickness of the border
                      ),
                    ),
                    child: Text(
                      board[index],
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
