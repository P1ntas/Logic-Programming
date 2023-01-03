
:- consult('display.pl').
:- consult('play.pl').
:- consult('input.pl').
:- consult('logic.pl').
:- consult('bot.pl').
:- consult('utils.pl').

:-[input], [play], [display], [logic], [bot].
:-use_module(library(random)).
:-use_module(library(clpfd)).
:-use_module(library(lists)).
:-use_module(library(system)).
:- use_module(library(random)).


% Main function
% Calls the initial functions

% start the game
play :-
    repeat,
    display_menu,
    read_number(0, 3, Input),
    handle_input(Input).


% To play the game, you can simply run the play predicate in the Prolog interpreter. The game will then prompt you to select which stones to move, and the computer will make its moves automatically. The game will continue until one of the players wins or there are no more moves left.