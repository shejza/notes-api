<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    protected $fillable = [
        'user_id',
        'title',
        'date',
        'total_time' 
    ];
}
