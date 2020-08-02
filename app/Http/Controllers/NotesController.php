<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Note;
use App\NoteDescription;
use Auth;

class NotesController extends Controller
{
     public function get(Request $request)  {
        $user = $request->user('api');
        $offset = isset($request->offset) ? $request->offset : 0;
        $limit = isset($request->limit) ? $request->limit : 10;
        $search = $request->search;

        $notes = Note::when($search, function($query) use ($search) {
            $query->where('title', 'like', '%'. $search .'%');
        })
            ->where('user_id', $user->id)
            ->orderBy('updated_at', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        return response()->json($notes, 200);
    }

    public function create(Request $request) {
  
        $user = $request->user('api');
        $notes = new Note;
        $notes->user_id =  $user->id;
        $notes->title = $request->title;
        $notes->date = $request->date;
        $notes->total_time = $request->total_time;
        $notes->save();
 
        foreach($request->descriptions as $note_description){    
            $notesId = $notes->id;
            $notes_desc = new NoteDescription;
            $notes_desc->notes_id = $notesId;
            $notes_desc->description = $note_description;
            $notes_desc->user_id =  $user->id;
            $notes_desc->save();
        }

    
        return response()->json($notes, 201);
    }

      public function update(Request $request)  {
        $notesId = $request->route('id');

        $notes = Note::find($notesId);
        $notes->title = $request->title;
        $notes->date = $request->date;
        $notes->total_time = $request->total_time;
        $notes->save();
        $notes_description = NoteDescription::where('notes_id', $notesId)->get();

        $i = 0;
        foreach($notes_description as $note_description){  
            $note_description->description = $request->descriptions[$i];
            $note_description->save();
            $i++;
        }
         return response()->json($note_description, 201);
       
       }

     public function delete(Request $request) {
        $notes_id = $request->route('id');
        NoteDescription::where('notes_id', $notes_id)->delete();
        Note::where('id', $notes_id)->delete();
        
        return response()->json($notes_id, 205);
    }
}
