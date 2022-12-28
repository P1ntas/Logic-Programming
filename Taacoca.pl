/*
:- consult('display.pl').
:- consult('play.pl').
:- consult('input.pl').
:- consult('logic.pl').
:- consult('bot.pl').
*/
:-dynamic board/1.

:-[input], [play], [display], [logic], [bot].
:-use_module(library(random)).
:-use_module(library(clpfd)).
:-use_module(library(lists)).
:-use_module(library(system)).

% Main function
% Calls the initial functions

% start the game
play :-
    board(Board),
    game(Board, w, 3).

% To play the game, you can simply run the play predicate in the Prolog interpreter. The game will then prompt you to select which stones to move, and the computer will make its moves automatically. The game will continue until one of the players wins or there are no more moves left.