import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.taskName,
    required this.taskDescription,
    required this.createdDate,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.typeOfTask,
    required this.backgroundColor,
  });

  final taskName, taskDescription, createdDate, typeOfTask;
  final VoidCallback onEditPressed, onDeletePressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(4),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskName,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              const SizedBox(height: 8,),
              Text(taskDescription,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              const SizedBox(height: 12,),
              Text(createdDate,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              const SizedBox(height: 4,),
              Row(children: [
                Chip(
                    backgroundColor: backgroundColor,
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                      child: Text(typeOfTask, style: const TextStyle(color: Colors.white),),
                    )),
                const Spacer(),
                IconButton(onPressed: onEditPressed, icon: const Icon(Icons.edit_note,color: Colors.green,)),
                const SizedBox(width: 12,),
                IconButton(onPressed: onDeletePressed, icon: const Icon(Icons.delete,color: Colors.red,)),
              ],)

            ],
          ),
        ),
      ),
    );
  }
}