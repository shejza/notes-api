<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NoteDescription extends Model
{
  protected $table = 'notesdescription';
  protected $fillable = [
        'notes_id',
        'user_id',
        'description',
    ];
}
