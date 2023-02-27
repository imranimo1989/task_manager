import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key, required this.taskName,required this.taskDescription,required this.createdDate, required this.onEditPressed, required this.onDeletePressed, required this.typeOfTask,
  });

  final taskName, taskDescription, createdDate, typeOfTask;
  final VoidCallback onEditPressed, onDeletePressed;

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
              Text(taskName,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              const SizedBox(height: 8,),
              Text(taskDescription,style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
              const SizedBox(height: 8,),
              Text(createdDate,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              const SizedBox(height: 16,),
              Row(children: [
                Chip(
                    backgroundColor: Colors.blue,
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                      child: Text(typeOfTask, ),
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