<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Note;
use App\NoteDescription;
use Illuminate\Support\Facades\DB;
use Auth;
use Carbon;

class NotesController extends Controller
{
     public function get(Request $request)  {
        $user = $request->user('api');
        
        $notes = DB::table('notes')->when($user->role_id != 1, 
        function($query) use ($user) {
             $query->where('user_id', $user->id);
        })->get();

        foreach ($notes as $note) {
            $note->descriptions = NoteDescription::where('notes_id', $note->id)->get();
        }
 
        return response()->json($notes, 200);
    }

    public function create(Request $request) {
  
        $user = $request->user('api');
        $notes = new Note;
        $notes->user_id =  $user->id;
        $notes->title = $request->title;
        $notes->date = Carbon\Carbon::parse($request->date)->format('Y-m-d') ;
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

        $notes->descriptions = NoteDescription::where('notes_id', $notes->id)->get();

        return response()->json($notes, 201);
    }

      public function update(Request $request)  {
        $notesId = $request->route('id');
        $user = $request->user('api');
        $notes = Note::find($notesId);
        $notes->title = $request->title;
        $notes->date = Carbon\Carbon::parse($request->date)->format('Y-m-d');
        $notes->total_time = $request->total_time;
        $notes->save();
        $notes_description = NoteDescription::where('notes_id', $notesId)->delete();

           foreach($request->descriptions as $note_description){    
            $notesId = $notes->id;
            $notes_desc = new NoteDescription;
            $notes_desc->notes_id = $notesId;
            $notes_desc->description = $note_description;
            $notes_desc->user_id =  $user->id;
            $notes_desc->save();
        }

        $notes->descriptions = NoteDescription::where('notes_id', $notes->id)->get();
         return response()->json($notes, 201);

       }

     public function delete(Request $request) {
        $notes_id = $request->route('id');
        NoteDescription::where('notes_id', $notes_id)->delete();
        Note::where('id', $notes_id)->delete();
        
        return response()->json($notes_id, 205);
    }
}
