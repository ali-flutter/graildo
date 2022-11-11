import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

final monthNumber = StateProvider<int>((ref) => DateTime.now().month);
final months = StateProvider<List<String>>((ref) =>['January','February','March','April','May','June','July','August','September','October','November','December']);
final daysOfMonth=StateProvider<List<int>>((ref)=>[]);
final selectedDayIndex=StateProvider<int?>((ref) => (DateTime.now().day)-1);
final hoursOfADay=StateProvider((ref)=> []);

///add task state
final errorMessage=StateProvider.autoDispose<String>((ref)=>'');
final textFormFieldText=StateProvider<String?>((ref) => null);
final initalDate=StateProvider<String>((ref)=>DateFormat('yyyy/MM/dd - HH:mm').format(DateTime.now()));
final pickedDate=StateProvider<DateTime?>((ref)=>null);
final task=StateProvider<Map>((ref)=>{});
final allTasks=StateProvider((ref) => []);